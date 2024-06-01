namespace Athanasia.Models.Util
{
    //Secret Manager
    public class KeysModel
    {
        public string Issuer { get; set; }
        public string Audience { get; set; }
        public string SecretKey { get; set; }
        public string SqlServerAzure { get; set; }
        public string bucket { get; set; }
    }
}
