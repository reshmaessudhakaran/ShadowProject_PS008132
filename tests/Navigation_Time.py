import cv2

def Navigation_Time():

    VideoPath = 'C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Navigationtime/video/home_to_shorts.mp4'
    FramePath = 'C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Navigationtime/frames/'
    ReferenceImage = "C:/Users/RESHMA SUDHAKARAN/PycharmProjects/YoutubeLaunch/output/Navigationtime/reference/reference.jpg"
    vidcap = cv2.VideoCapture(VideoPath)
    success, image = vidcap.read()
    count = 0

    while success:
        cv2.imwrite(FramePath+"frame%d.jpg" % count, image)
        success, image = vidcap.read()
        count += 1
    FPS = count/7
    #FPS = FPS /19
    print("FPS is %d" %FPS)
    print("Start comparing reference frame with each frame.")
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
                    navigate_time = (image+1) / FPS
                    print("Navigation  time is %f sec" % navigate_time)
                    loop = False
                else:
                    print("Reference image not matching with this frame. Check for next frame %d" % image)
                image += 1
        else:
            print("Reference image not matching with any frame. Please record for more duration and try again.")
    return navigate_time
Navigation_Time()