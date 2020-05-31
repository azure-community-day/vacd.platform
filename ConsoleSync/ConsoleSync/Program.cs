using Newtonsoft.Json.Linq;
using RestSharp;
using System;

namespace ConsoleSync
{
    class Program
    {
        static void Main(string[] args)
        {
            var secretValue = System.Text.Encoding.UTF8.GetBytes(args[1]);

            var client = new RestClient("https://api.github.com/orgs/azure-community-day/actions/secrets/public-key");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "token " + args[0]);
            IRestResponse response = client.Execute(request);
            dynamic api = JObject.Parse(response.Content);
            string public_key = Convert.ToString(api.key);
            string key_id = Convert.ToString(api.key_id);

            var publicKey = Convert.FromBase64String(public_key);
            var sealedPublicKeyBox = Sodium.SealedPublicKeyBox.Create(secretValue, publicKey);

            //Console.WriteLine(Convert.ToBase64String(sealedPublicKeyBox));

            client = new RestClient("https://api.github.com/orgs/azure-community-day/actions/secrets/AZURE_WEBAPP_PUBLISH_PROFILE");
            client.Timeout = -1;
            request = new RestRequest(Method.PUT);
            request.AddHeader("Authorization", "token " + args[0]);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("application/json", "{\n  \"encrypted_value\": \""+Convert.ToBase64String(sealedPublicKeyBox)+"\",\n  \"key_id\": \""+key_id+"\",\n  \"visibility\": \"selected\",\n  \"selected_repository_ids\": [268068809,268047790]\n}", ParameterType.RequestBody);
            response = client.Execute(request);
            //Console.WriteLine(response.Content);
        }
    }
}
