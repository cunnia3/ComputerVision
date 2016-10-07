% Read spheres
sphere2 = imread('sphere/sphere2.pgm');
sphere3 = imread('sphere/sphere3.pgm');
sphere4 = imread('sphere/sphere4.pgm');
sphere5 = imread('sphere/sphere5.pgm');
sphere6 = imread('sphere/sphere6.pgm');
spheres = cat(3,sphere2,sphere3,sphere4,sphere5,sphere6);

% Read grid
grid1 = imread('grid/center1.jpg');
grid2 = imread('grid/center2.jpg');
grid3 = imread('grid/center3.jpg');
grid4 = imread('grid/center4.jpg');
grid5 = imread('grid/center5.jpg');
grids = cat(3,grid1,grid2,grid3,grid4,grid5);

% Read people
people1 = imread('people/1.pgm');
people2 = imread('people/2.pgm');
people3 = imread('people/3.pgm');
people4 = imread('people/4.pgm');
people5 = imread('people/5.pgm');
peoples = cat(3,people1,people2,people3,people4,people5);


%% OF FOR SPHERES
boxSize = 2;
figure; hold on;
for c=15:5:185
    for r=15:5:185
        centralPixel = [c;r];
        A = fitCubicRegion(spheres,centralPixel,boxSize);
        v=lucasKMethod(A,2); 
        quiver(r,c,v(2),v(1),'b','MaxHeadSize',8)
    end
end

% % OF FOR GRID
% boxSize = 16;
% figure; hold on;
% for c=335:20:535
%     for r=275:20:475
%         centralPixel = [c;r];
%         A = fitCubicRegion(grids,centralPixel,boxSize);
%         v=lucasKMethod(A,12); 
%         quiver(r,c,v(2),v(1),'b','MaxHeadSize',8)
%     end
% end
% 
% % OF FOR PEOPLE
% boxSize = 2;
% figure; hold on;
% for c=10:2:230
%     for r=10:2:310
%         centralPixel = [c;r];
%         A = fitCubicRegion(peoples,centralPixel,boxSize);
%         v=lucasKMethod(A,1);
%         if norm(v) > 0
%             quiver(r,c,v(2),v(1),'b','MaxHeadSize',8)
%         end
%     end
% end