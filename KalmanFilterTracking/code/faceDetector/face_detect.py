import cv2
import sys

# Get user supplied values
imagePath = 'face_tracking_1.png'
cascPath = 'haarcascade_frontalface_default.xml'

# Create the haar cascade
faceCascade = cv2.CascadeClassifier(cascPath)

# Read the image

f=open('results.txt', 'w')

for i in range(3,100):
    #print i
    imagePath = 'face_tracking_'+str(i)+'.png'
    image = cv2.imread(imagePath)
    image = cv2.imread(imagePath)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # Detect faces in the image
    faces = faceCascade.detectMultiScale(
        gray,
        scaleFactor=1.1,
        minNeighbors=12,
        minSize=(100, 100),
        flags = cv2.CASCADE_SCALE_IMAGE
    )
    
    print "Found {0} faces!".format(len(faces))
    
    # Draw a rectangle around the faces
    for (x, y, w, h) in faces:
        message = str(x+w/2) + ',' + str(y+h/2) + '\n'
        #print message
        f.write(message)
        
f.write('\n DONE2')
        


