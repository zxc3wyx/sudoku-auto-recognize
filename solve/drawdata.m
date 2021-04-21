function [] = drawdata(matrix,is_subplot, xs, ys)

handle = figure;

Position = get(handle, 'Position');
set(handle,'Position',[Position(1:2),550,550],'visible','off','units','normalized');


if is_subplot == true
    plot(xs, ys);
    
matrix0 = matrix;
matrix0=matrix0';    
plot(0,0);
hold on
for i = 0 : 9
    if rem(i,3) == 0
        plot([0;9],[i,i],'linewidth',3,'color','black');
        plot([i;i],[0,9],'linewidth',3,'color','black');
    else
        plot([0;9],[i,i],'linewidth',1,'color','black');
        plot([i;i],[0,9],'linewidth',1,'color','black');
    end
end

for i = 1 : 9
    for j = 1 : 9
           if matrix0(i,j) ~= 0
                text(i-0.5, 9.5-j, strcat('\color{red}',num2str(matrix0(i,j))));
            else
                %text(i-0.5, 9.5-j, num2str(matrix0(i,j)));
            end
                
           
       
    end
end
print(handle,'-djpeg','-r0','raw.jpg');
end