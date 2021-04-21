function disposeEdge(url_name)
    %DISPOSEEDGE �˴���ʾ�йش˺�����ժҪ
    origin = imread(url_name);
    thresh = graythresh(origin);     %�Զ�ȷ����ֵ����ֵ
    bwimg = im2bw(origin,thresh);       %��ͼ���ֵ��
    [imx, imy] = size(bwimg);
    Iedge = edge(bwimg, 'sobel');
    [H1, T1, R1] = hough(Iedge);
    peaks = houghpeaks(H1, 20);
    lines = houghlines(Iedge, T1, R1, peaks);
    hold on;
    for k = 1:length(lines)
        % ���Ƹ�����
        xy = [lines(k).point1; lines(k).point2];
        y1 = xy(1);
        y2 = xy(2);
        x1 = xy(3);
        x2 = xy(4);
        if x1 == x2
            bound1 = max([1, x1-round(imx / 100)]);
            bound2 = min([x1+round(imx / 100), imx]);
            bwimg(bound1:bound2,:) = 1;
        elseif y1 == y2
            bound1 = max([1, y1-round(imy / 100)]);
            bound2 = min([y1+round(imy / 100), imy]);
            bwimg(:, bound1:bound2) = 1;
        end
    end
    A = [1, ceil(imx/9:imx/9:imx)];
    B = [1, ceil(imy/9:imy/9:imy)];
    for i= 1:9
        for j = 1:9
            part = bwimg(A(i):A(i+1), B(j):B(j+1));
            name = sprintf('%d-%d.jpg', i, j);
            imwrite(part,name);
        end
    end
    %   �˴���ʾ��ϸ˵��
end

