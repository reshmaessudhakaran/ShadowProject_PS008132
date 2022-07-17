import cv2

def Video_to_Frame_Convert():

    VideoPath = 'C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Applaunchtime/video/youtubelaunchvideo.mp4'
    FramePath = 'C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Applaunchtime/frames/'
    ReferenceImage = "C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Applaunchtime/reference/referenceframe.jpg"
    vidcap = cv2.VideoCapture(VideoPath)
    success, image = vidcap.read()
    count = 0

    while success:
        cv2.imwrite(FramePath+"frame%d.jpg" % count, image)
        success, image = vidcap.read()
        count += 1
    FPS = count/10
    print("FPS is %d" %FPS)
    print("Start comparing reference frame with ecah frame.")
    loop = True
    image = 0
    while loop:
        reference = cv2.imread(ReferenceImage)
        if image<count:
            frames = cv2.imread(FramePath + "frame%d.jpg" % image)
            if True:
                difference = cv2.subtract(reference, frames)
                b, g, r = cv2.split(difference)
                if cv2.countNonZero(b) == 0 and cv2.countNonZero(g) == 0 and  cv2.countNonZero(r) == 0:
                    print("Frame Number %d is same" % image)
                    Time_Calculated = (image+1) / FPS
                    print("App launch time is %f sec" % Time_Calculated)
                    loop = False
                else:
                    print("Reference image not matching with this frame. Check for next frame %d" % image)
                image += 1
        else:
            print("Reference image not matching with any frame. Please record for more duration and try again.")
    return Time_Calculated
Video_to_Frame_Convert()