namespace InstaFood.Shared.Services
{
    public static class PageHistoryState
    {
        private static List<string> previousPages = new List<string>();

        public static void AddPageToHistory(string pageName)
        {
            previousPages.Add(pageName);
        }

        public static string GetGoBackPage()
        {
            if (previousPages.Count > 1)
            {
                // You add a page on initialization, so you need to return the 2nd from the last
                return previousPages.ElementAt(previousPages.Count - 2);
            }

            // Can't go back because you didn't navigate enough
            return previousPages.FirstOrDefault();
        }

        public static bool CanGoBack()
        {
            return previousPages.Count > 1;
        }
    }
}
