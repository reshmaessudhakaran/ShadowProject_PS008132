import cv2

VideoPath = 'C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Videoplayback/video/Start_Or_Stop.mp4'
FramePath = 'C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Videoplayback/frames/'
ReferenceImage = "C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Videoplayback/reference/ref2.jpg"
vid = cv2.VideoCapture(VideoPath)
success, image = vid.read()
count = 0
while success:
    cv2.imwrite(FramePath + "frame%d.jpg" % count, image)
    success, image = vid.read()
    count += 1