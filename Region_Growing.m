clear global;
clc;

image = imread('fat_cells.jpg');
image = PCA (image);
%image = rgb2gray(image);
[r , c] = size (image);
regions = zeros ( r , c , 'uint8') ;
treshold = 5;
region_label = 1 ;
 frame_title = [ ' This is a mask , even 1 unit defference between' ...
  ' labels is improtant and cant be shown here'];


 for i = 1 : r
     for j = 1 : c   
         if ( regions (i,j) == 0 ) %means it's not been labeled yet
           regions = grow (image, i , j , image(i,j) , treshold , regions , region_label);
           region_label = region_label + 1 ;
         end    
     end
 end
 
 
 
% The numbers calculated in regions is important
% We cannot get much information from considering regions as an image
 figure;
 subplot(1 , 1 ,1 );
 imshow(regions);
 title ( frame_title );
 

 
