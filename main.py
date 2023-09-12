from pytube import YouTube

def Download(link):
    youtubeObj = YouTube(link)
    youtubeObj = youtubeObj.streams.get_highest_resolution()
    try:
        youtubeObj.download()
    except:
        print("There is an Error to  Downloading")
    print("Downloaded Successfully")

link = input("Enter the link: ")
Download(link)
