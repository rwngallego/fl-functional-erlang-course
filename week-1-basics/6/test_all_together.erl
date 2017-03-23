%%%%%% Testing %%%%%%
% Copy and paste the following content into the erl console

Circle = {circle, 45}.
Rectangle = {rectangle, 5, 7}.
RightTriangle = {right_triangle, 3, 4, 5}.
all_together:perimeter(Circle).
all_together:perimeter(Rectangle).
all_together:perimeter(RightTriangle).
all_together:area(Circle).
all_together:area(Rectangle).
all_together:area(RightTriangle).
all_together:enclose(Circle).
all_together:enclose(Rectangle).
all_together:enclose(RightTriangle).
all_together:bits(7).
all_together:bits(8).
all_together:bits_tail(7).
all_together:bits_tail(8).