## <內容更正如下> 

### 2-11 將檔案搬進 Container 的方法 

這裡要介紹的情境是說，當你的 Container 裡，沒有 ssh、scp、curl、和 wget 等等可以對外取檔的環境時，而大部份的 Docker Image 裡，也都不會提供這一類的程式供使用，主要是減少 Image 的檔案大小和提高安全性的考量，因此，就會需要用到 docker cp 指令來把檔案複製進去 Container 或從 Container 裡複製出來，下面就是用 docker cp 指令複製檔案的方式。

- 把檔案複製到 Container 裡

   ~~$ docker cp <檔案來源 Conatiner ID 或名稱>:<檔案名稱與完整路徑> <完整目的資料夾路徑>~~

   $ docker cp <檔案來源檔案名稱與完整路徑> <目的 Conatiner ID 或名稱>:<完整目的資料夾路徑>

- 把檔案從 Container 複製出來

   ~~$ docker cp <檔案來源檔案名稱與完整路徑> <目的 Conatiner ID 或名稱>:<完整目的資料夾路徑>~~
   
   $ docker cp <檔案來源 Conatiner ID 或名稱>:<檔案名稱與完整路徑> <完整目的資料夾路徑>
