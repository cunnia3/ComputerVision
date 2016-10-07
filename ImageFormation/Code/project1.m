%% ECSE 6650
% PROJECT 1
% AUTHOR: Andrew Cunningham
load('CV1_data.mat')

% Different options
f1=40; f2=30;
L1 = [0 0 -1]; L2 = [0.5774, -0.5774, -0.5774];
R1 = eye(3); R2 = [.9848 0 .1736; 0 1 0; -.1736 0 .9848];

%% R1 L1 f1 image
[pixels, pixelIntensities]=formPixelsFromPoints(L1,R1,f1);
result1 = formImage(pixels,pixelIntensities);

%% R1 L1 f2 image
[pixels, pixelIntensities]=formPixelsFromPoints(L1,R1,f2);
result2 = formImage(pixels,pixelIntensities);

%% R1 L2 f1 image
[pixels, pixelIntensities]=formPixelsFromPoints(L2,R1,f2);
result3 = formImage(pixels,pixelIntensities);

%% R1 L2 f2 image
[pixels, pixelIntensities]=formPixelsFromPoints(L2,R1,f2);
result4 = formImage(pixels,pixelIntensities);

%% R2 L1 f1 image
[pixels, pixelIntensities]=formPixelsFromPoints(L1,R2,f1);
result5 = formImage(pixels,pixelIntensities);

%% R2 L1 f2 image
[pixels, pixelIntensities]=formPixelsFromPoints(L1,R2,f2);
result6 = formImage(pixels,pixelIntensities);

%% R2 L2 f1 image
[pixels, pixelIntensities]=formPixelsFromPoints(L2,R2,f1);
result7 = formImage(pixels,pixelIntensities);

%% R2 L2 f2 image
[pixels, pixelIntensities]=formPixelsFromPoints(L2,R2,f2);
result8 = formImage(pixels,pixelIntensities);

%graph
figure
subplot(4,2,1)
imshow(result1)
title('R1 L1 f1')
subplot(4,2,2)
imshow(result2)
title('R1 L1 f2')
subplot(4,2,3)
imshow(result3)
title('R1 L2 f1')
subplot(4,2,4)
imshow(result4)
title('R1 L2 f2')
subplot(4,2,5)
imshow(result5)
title('R2 L1 f1')
subplot(4,2,6)
imshow(result6)
title('R2 L1 f2')
subplot(4,2,7)
imshow(result7)
title('R2 L2 f1')
subplot(4,2,8)
imshow(result8)
title('R2 L2 f2')