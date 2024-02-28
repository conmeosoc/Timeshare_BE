namespace TimeshareExchangeAPI.Helper
{
    public static class ImageHandler
    {
        public static string UploadImageToFile(IWebHostEnvironment webHostEnvironment, IFormFile formFile, string uniqueID)
        {
            if (formFile.Length > 0)
            {
                var contentPath = webHostEnvironment.ContentRootPath;
                var folderPath = Path.Combine(contentPath, "Uploads");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                var extentionFile = Path.GetExtension(formFile.FileName);
                var filePath = Path.Combine(folderPath, uniqueID + extentionFile);
                var returnFilePath = Path.Combine("Uploads", uniqueID + extentionFile);
                var count = 0;
                while (File.Exists(filePath))
                {
                    count = count + 1;
                    var newFileName = uniqueID + "_" + count;
                    filePath = Path.Combine(folderPath, newFileName + extentionFile);
                    returnFilePath = Path.Combine("Uploads", newFileName + extentionFile);
                }
                using (var stream = System.IO.File.Create(filePath))
                {
                    formFile.CopyTo(stream);
                }
                return returnFilePath;
            }
            return null;
        }
        public static string UploadImagesToFile(IWebHostEnvironment webHostEnvironment, IFormFile[] formFiles, string uniqueID)
        {
            List<string> filePathName = new List<string>();
            try
            {
                foreach (var formFile in formFiles)
                {
                    string imagePath = ImageHandler.UploadImageToFile(webHostEnvironment, formFile, uniqueID);
                    filePathName.Add(imagePath);
                }
                // chỗ này foreach formFiles rồi gọi hàm UploadImageToFile
            }
            catch (Exception ex)
            {

                //throw ex;
            }
            return string.Join("'", filePathName,"'");
        }
    }
}
