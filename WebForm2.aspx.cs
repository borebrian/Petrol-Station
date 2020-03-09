using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace Petrol_Station
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        void send()
        {
            const string accountSid = "ACd4a1e278c11cd354a1f037d9ea819b60";
            const string authToken = "a6f1c426651e5f781bfe8a5449582d4f";

            TwilioClient.Init(accountSid, authToken);

            var message = MessageResource.Create(
                body: "Hello World!",
                from: new Twilio.Types.PhoneNumber("+19093414737"),
                to: new Twilio.Types.PhoneNumber("+254712035642")
            );

            Console.WriteLine(message.Sid); }

        protected void Button1_Click(object sender, EventArgs e)
        {
            send();
        }
    }
    }
