using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

namespace Prabhu
{
    public class Pop3Client : IDisposable
    {
        public string Host { get; protected set; }
        public int Port { get; protected set; }
        public string Email { get; protected set; }
        public string Password { get; protected set; }
        public bool IsSecure { get; protected set; }
        public TcpClient Client { get; protected set; }
        public Stream ClientStream { get; protected set; }
        public StreamWriter Writer { get; protected set; }
        public StreamReader Reader { get; protected set; }
        private bool disposed = false;
        public Pop3Client(string host, int port, string email, string password): this(host, port, email, password, false){}
        public Pop3Client(string host, int port, string email, string password, bool secure)
        {
            Host = host;
            Port = port;
            Email = email;
            Password = password;
            IsSecure = secure;
        }
        public void Connect()
        {
            if (Client == null)
                Client = new TcpClient();
            if (!Client.Connected)
                Client.Connect(Host, Port);
            if (IsSecure)
            {
                SslStream secureStream = new SslStream(Client.GetStream());
                secureStream.AuthenticateAsClient(Host);
                ClientStream = secureStream;
                secureStream = null;
            }
            else
                ClientStream = Client.GetStream();
            Writer = new StreamWriter(ClientStream);
            Reader = new StreamReader(ClientStream);
            ReadLine();
            Login();
        }
        public int GetEmailCount()
        {
            int count = 0;
            string response = SendCommand("STAT");
            if (IsResponseOk(response))
            {
                string[] arr = response.Substring(4).Split(' ');
                count = Convert.ToInt32(arr[0]);
            }
            else
                count = -1;
            return count;
        }
        public Email FetchEmail(int emailId)
        {
            if (IsResponseOk(SendCommand("TOP " + emailId + " 0")))
                return new Email(ReadLines());
            else
                return null;
        }
        public List<Email> FetchEmailList(int start, int count)
        {
            List<Email> emails = new List<Email>(count);
            for (int i = start; i < (start + count); i++)
            {
                Email email = FetchEmail(i);
                if (email != null)
                    emails.Add(email);
            }
            return emails;
        }
        public List<MessagePart> FetchMessageParts(int emailId)
        {
            if (IsResponseOk(SendCommand("RETR " + emailId)))
                return Util.ParseMessageParts(ReadLines());

            return null;
        }
        public void Close()
        {
            if (Client != null)
            {
                if (Client.Connected)
                    Logout();
                Client.Close();
                Client = null;
            }
            if (ClientStream != null)
            {
                ClientStream.Close();
                ClientStream = null;
            }
            if (Writer != null)
            {
                Writer.Close();
                Writer = null;
            }
            if (Reader != null)
            {
                Reader.Close();
                Reader = null;
            }
            disposed = true;
        }
        public void Dispose()
        {
            if (!disposed)
                Close();
        }
        protected void Login()
        {
            if (!IsResponseOk(SendCommand("USER " + Email)) || !IsResponseOk(SendCommand("PASS " + Password)))
                throw new Exception("User/password not accepted");
        }
        protected void Logout()
        {
            SendCommand("RSET");
        }
        protected string SendCommand(string cmdtext)
        {
            Writer.WriteLine(cmdtext);
            Writer.Flush();
            return ReadLine();
        }
        protected string ReadLine()
        {
            return Reader.ReadLine() + "\r\n";
        }
        protected string ReadLines()
        {
            StringBuilder b = new StringBuilder();
            while (true)
            {
                string temp = ReadLine();
                if (temp == ".\r\n" || temp.IndexOf("-ERR") != -1)
                    break;
                b.Append(temp);
            }
            return b.ToString();
        }
        protected static bool IsResponseOk(string response)
        {
            if (response.StartsWith("+OK"))
                return true;
            if (response.StartsWith("-ERR"))
                return false;
            throw new Exception("Cannot understand server response: " + response);
        }
    }
    public class Email
    {
        public NameValueCollection Headers { get; protected set; }
        public string ContentType { get; protected set; }
        public DateTime UtcDateTime { get; protected set; }
        public string From { get; protected set; }
        public string To { get; protected set; }
        public string Subject { get; protected set; }
        public Email(string emailText)
        {
            Headers = Util.ParseHeaders(emailText);
            ContentType = Headers["Content-Type"];
            From = Headers["From"];
            To = Headers["To"];
            Subject = Headers["Subject"];
            if (Headers["Date"] != null)
                try
                {
                    UtcDateTime =Util.ConvertStrToUtcDateTime(Headers["Date"]);
                }
                catch (FormatException)
                {
                    UtcDateTime = DateTime.MinValue;
                }
            else
                UtcDateTime = DateTime.MinValue;
        }
    }
    public class MessagePart
    {
        public NameValueCollection Headers { get; protected set; }
        public string ContentType { get; protected set; }
        public string MessageText { get; protected set; }
        public MessagePart(NameValueCollection headers, string messageText)
        {
            Headers = headers;
            ContentType = Headers["Content-Type"];
            MessageText = messageText;
        }
    }
    public class Util
    {
        protected static Regex BoundaryRegex = new Regex("Content-Type: multipart(?:/\\S+;)" + "\\s+[^\r\n]*boundary=\"?(?<boundary>" + "[^\"\r\n]+)\"?\r\n", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        protected static Regex UtcDateTimeRegex = new Regex(@"^(?:\w+,\s+)?(?<day>\d+)\s+(?<month>\w+)\s+(?<year>\d+)\s+(?<hour>\d{1,2})" + @":(?<minute>\d{1,2}):(?<second>\d{1,2})\s+(?<offsetsign>\-|\+)(?<offsethours>" + @"\d{2,2})(?<offsetminutes>\d{2,2})(?:.*)$", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        public static NameValueCollection ParseHeaders(string headerText)
        {
            NameValueCollection headers = new NameValueCollection();
            StringReader reader = new StringReader(headerText);
            string line;
            string headerName = null, headerValue;
            int colonIndx;
            while ((line = reader.ReadLine()) != null)
            {
                if (line == "")
                    break;
                if (Char.IsLetterOrDigit(line[0]) && (colonIndx = line.IndexOf(':')) != -1)
                {
                    headerName = line.Substring(0, colonIndx);
                    headerValue = line.Substring(colonIndx + 1).Trim();
                    headers.Add(headerName, headerValue);
                }
                else if (headerName != null)
                    headers[headerName] += " " + line.Trim();
                else
                    throw new FormatException("Could not parse headers");
            }
            return headers;
        }
        public static List<MessagePart> ParseMessageParts(string emailText)
        {
            List<MessagePart> messageParts = new List<MessagePart>();
            int newLinesIndx = emailText.IndexOf("\r\n\r\n");
            Match m = BoundaryRegex.Match(emailText);
            if (m.Index < emailText.IndexOf("\r\n\r\n") && m.Success)
            {
                string boundary = m.Groups["boundary"].Value;
                string startingBoundary = "\r\n--" + boundary;
                int startingBoundaryIndx = -1;
                while (true)
                {
                    if (startingBoundaryIndx == -1)
                        startingBoundaryIndx = emailText.IndexOf(startingBoundary);
                    if (startingBoundaryIndx != -1)
                    {
                        int nextBoundaryIndx = emailText.IndexOf(startingBoundary, startingBoundaryIndx + startingBoundary.Length);
                        if (nextBoundaryIndx != -1 && nextBoundaryIndx != startingBoundaryIndx)
                        {
                            string multipartMsg = emailText.Substring(startingBoundaryIndx + startingBoundary.Length, (nextBoundaryIndx - startingBoundaryIndx - startingBoundary.Length));
                            int headersIndx = multipartMsg.IndexOf("\r\n\r\n");
                            if (headersIndx == -1)
                                throw new FormatException("Incompatible multipart message format");
                            string bodyText = multipartMsg.Substring(headersIndx).Trim();
                            NameValueCollection headers = Util.ParseHeaders(multipartMsg.Trim());
                            messageParts.Add(new MessagePart(headers, bodyText));
                        }
                        else
                            break;
                        startingBoundaryIndx = nextBoundaryIndx;
                    }
                    else
                        break;
                }
                if (newLinesIndx != -1)
                {
                    string emailBodyText = emailText.Substring(newLinesIndx + 1);
                }
            }
            else
            {
                int headersIndx = emailText.IndexOf("\r\n\r\n");
                if (headersIndx == -1)
                    throw new FormatException("Incompatible multipart message format");
                string bodyText = emailText.Substring(headersIndx).Trim();
                NameValueCollection headers = Util.ParseHeaders(emailText);
                messageParts.Add(new MessagePart(headers, bodyText));
            }
            return messageParts;
        }
        public static DateTime ConvertStrToUtcDateTime(string str)
        {
            Match m = UtcDateTimeRegex.Match(str);
            int day, month, year, hour, min, sec;
            if (m.Success)
            {
                day = Convert.ToInt32(m.Groups["day"].Value);
                year = Convert.ToInt32(m.Groups["year"].Value);
                hour = Convert.ToInt32(m.Groups["hour"].Value);
                min = Convert.ToInt32(m.Groups["minute"].Value);
                sec = Convert.ToInt32(m.Groups["second"].Value);
                switch (m.Groups["month"].Value)
                {
                    case "Jan":
                        month = 1;
                        break;
                    case "Feb":
                        month = 2;
                        break;
                    case "Mar":
                        month = 3;
                        break;
                    case "Apr":
                        month = 4;
                        break;
                    case "May":
                        month = 5;
                        break;
                    case "Jun":
                        month = 6;
                        break;
                    case "Jul":
                        month = 7;
                        break;
                    case "Aug":
                        month = 8;
                        break;
                    case "Sep":
                        month = 9;
                        break;
                    case "Oct":
                        month = 10;
                        break;
                    case "Nov":
                        month = 11;
                        break;
                    case "Dec":
                        month = 12;
                        break;
                    default:
                        throw new FormatException("Unknown month.");
                }
                string offsetSign = m.Groups["offsetsign"].Value;
                int offsetHours = Convert.ToInt32(m.Groups["offsethours"].Value);
                int offsetMinutes = Convert.ToInt32(m.Groups["offsetminutes"].Value);
                DateTime dt = new DateTime(year, month, day, hour, min, sec);
                if (offsetSign == "+")
                {
                    dt.AddHours(offsetHours);
                    dt.AddMinutes(offsetMinutes);
                }
                else if (offsetSign == "-")
                {
                    dt.AddHours(-offsetHours);
                    dt.AddMinutes(-offsetMinutes);
                }
                return dt;
            }
            throw new FormatException("Incompatible date/time string format");
        }
    }
}