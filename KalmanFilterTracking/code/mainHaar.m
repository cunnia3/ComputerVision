face_tracking_1 = [206, 303, 172, 172];
face_tracking_2 = [213, 303, 172, 172];

%% APPLY KALMAN FILTERING
stateVector = zeros(100,4);
stateVector(1,:) = [213,303,7,0]; % [X,Y,Vx,Vy]
cov = zeros(4,4,100);
cov(:,:,1) = eye(4,4)*100;

% IMPORT OBSERVATIONS FROM HAAR CLASSIFIER
z = csvread('results.txt');

phi = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1]; % State transition matrix
R = eye(2,2);
Q = eye(4); Q(4,4) = 4; Q(3,3) = 4; 
H = eye(2,4);
% apply kalman filtering to all of the images
for i=1:96
    % handle indices
    imageIndex = i+2;
    kalmanIndex = i+1;
    
    % predict
    pStateVector = phi*(stateVector(kalmanIndex-1,:))';
    covTp1 = phi*cov(kalmanIndex-1)*phi' + Q;
    
    % update
    pixelCoords = [stateVector(kalmanIndex-1,1), stateVector(kalmanIndex-1,2)];
    prevImage = rgb2gray(imread(strcat('data/face_tracking_',int2str(imageIndex-1),'.png')));
    currentImage = rgb2gray(imread(strcat('data/face_tracking_',int2str(imageIndex),'.png')));
    k = (covTp1*H')*inv(H*covTp1*H'+R);
    stateVector(kalmanIndex,:) = pStateVector + k*(z(kalmanIndex,:)'-H*pStateVector);
    cov(:,:,kalmanIndex)=(eye(4,4)-k*H)*covTp1;
end

%% GENERATE MOVIE
f = [];
for i=1:96 %start from 3rd image and go from there
    imageIndex = i+2;
    kalmanIndex = i+1;
    pixels=uint16(stateVector(kalmanIndex,1:2));
    image=imread(strcat('data/face_tracking_',int2str(imageIndex),'.png'));
    image = putXonImage(image,pixels,[50,205,50]);
    image = putXonImage(image,z(i,:),[0,0,0]);
    f=[f;im2frame(image)];
    
    mov(96-i+1)=im2frame(image);
end
% uncomment to save new gif
%movie2gif(mov, 'haarKalman.gif', 'LoopCount', 0, 'DelayTime', 0)

%% PLOT TRACE OF COVARIANCE MATRIX
x = []; y =[];
for i=1:size(cov,3)
    x = [x i];
    y = [y trace(cov(:,:,i))];
end
figure
plot(x,y)
