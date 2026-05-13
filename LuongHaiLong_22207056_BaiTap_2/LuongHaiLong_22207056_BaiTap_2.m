function LuongHaiLong_22207056_BaiTap_2
    % Tạo giao diện chính
    f = figure('Visible','off','Position',[100, 100, 1000, 700], ...
        'Name','BÁO CÁO GIỮA KỲ - Phương Pháp Tính và Matlab','NumberTitle','off', ...
        'MenuBar', 'none', 'Resize', 'off', 'Color', [0.94 0.94 0.94]);

    % --- TIÊU ĐỀ BÁO CÁO ---
    uicontrol('Style','text','String','BÁO CÁO GIỮA KỲ',...
        'Position',[300, 660, 400, 30],'FontSize',16,'FontWeight','bold', ...
        'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', [0 0.4470 0.7410]);

    % --- 1. THÔNG TIN SINH VIÊN ---
    uicontrol('Style','text','String','THÔNG TIN SINH VIÊN',...
        'Position',[20, 630, 250, 25],'FontSize',11,'FontWeight','bold', 'HorizontalAlignment', 'left', ...
        'BackgroundColor', [0.94 0.94 0.94]);
    
    % Panel chứa thông tin SV
    hPanelInfo = uipanel('Position',[0.02, 0.65, 0.25, 0.25], 'BackgroundColor', 'white', 'BorderType', 'line');

    % Ảnh sinh viên (Placeholder)
    hAxImage = axes('Parent', hPanelInfo, 'Units','normalized','Position',[0.1, 0.55, 0.8, 0.4], 'XTick', [], 'YTick', [], 'Box', 'on');
    
    % Để hiển thị ảnh thực tế, uncomment dòng dưới và thay đường dẫn ảnh
    try
        imshow('LuongHaiLong_22207056_BaiTap_2.jpg', 'Parent', hAxImage); 
    catch
        text(hAxImage, 0.5, 0.5, 'Ảnh SV', 'HorizontalAlignment', 'center'); 
    end
    
    % Thông tin text
    uicontrol('Parent', hPanelInfo, 'Style','text','String','Họ tên SV: LƯƠNG HẢI LONG',...
        'Units','normalized', 'Position',[0.05, 0.35, 0.9, 0.15],'HorizontalAlignment','left','FontSize',10, 'BackgroundColor', 'white');
    uicontrol('Parent', hPanelInfo, 'Style','text','String','MSSV: 22207056',...
        'Units','normalized', 'Position',[0.05, 0.2, 0.9, 0.15],'HorizontalAlignment','left','FontSize',10, 'BackgroundColor', 'white');
    uicontrol('Parent', hPanelInfo, 'Style','text','String','Lớp: 23DTV_CLC1',...
        'Units','normalized', 'Position',[0.05, 0.05, 0.9, 0.15],'HorizontalAlignment','left','FontSize',10, 'BackgroundColor', 'white');

    % --- 2. CHỌN BÀI TOÁN & NHẬP LIỆU ---
    uicontrol('Style','text','String','CHỌN BÀI TOÁN',...
        'Position',[20, 420, 200, 20],'FontSize',11,'FontWeight','bold', 'HorizontalAlignment', 'left', ...
        'BackgroundColor', [0.94 0.94 0.94]);
    
    % Popup menu chọn bài
    hPopup = uicontrol('Style','popupmenu',...
        'String',{'Chương 8: Bài 3.2 (x = sin(3x))', 'Chương 9: Bài 4.3 - Bài 1 (Cholesky)', 'Chương 9: Bài 4.3 - Bài 2 (Cholesky)', 'Chương 10: Bài 5.8 (Nội suy Newton)', 'Chương 11+12: Bài 6.6 (Euler)'},...
        'Position',[20, 390, 250, 25],...
        'Callback',{@popup_callback});

    % Panel nhập liệu
    hPanelInput = uipanel('Title','Dữ liệu đầu vào','Position',[0.02, 0.15, 0.25, 0.35], 'BackgroundColor', 'white');
    
    % Các trường nhập liệu (sẽ thay đổi tùy bài toán)
    hText1 = uicontrol('Parent',hPanelInput,'Style','text','String','Nhập hàm g(x):',...
        'Position',[10, 160, 200, 20],'HorizontalAlignment','left', 'BackgroundColor', 'white', 'FontWeight', 'bold');
    hEdit1 = uicontrol('Parent',hPanelInput,'Style','edit','String','(pi - asin(x))/3',...
        'Position',[10, 135, 220, 25], 'HorizontalAlignment', 'left');
    
    hText2 = uicontrol('Parent',hPanelInput,'Style','text','String','Giá trị đầu x0:',...
        'Position',[10, 105, 200, 20],'HorizontalAlignment','left', 'BackgroundColor', 'white', 'FontWeight', 'bold');
    hEdit2 = uicontrol('Parent',hPanelInput,'Style','edit','String','0.6',...
        'Position',[10, 80, 220, 25], 'HorizontalAlignment', 'left');
    
    hText3 = uicontrol('Parent',hPanelInput,'Style','text','String','Sai số tol:',...
        'Position',[10, 50, 200, 20],'HorizontalAlignment','left', 'BackgroundColor', 'white', 'FontWeight', 'bold');
    hEdit3 = uicontrol('Parent',hPanelInput,'Style','edit','String','1e-5',...
        'Position',[10, 25, 220, 25], 'HorizontalAlignment', 'left');

    % Nút Load Dữ Liệu Mẫu & Run
    uicontrol('Style','pushbutton','String','Load Data Mẫu',...
        'Position',[30, 50, 100, 35],...
        'Callback',{@load_data_callback});
        
    uicontrol('Style','pushbutton','String','RUN',...
        'Position',[150, 50, 100, 35],...
        'FontSize', 12, 'FontWeight', 'bold', 'BackgroundColor', [0.2, 0.8, 0.2], 'ForegroundColor', 'white',...
        'Callback',{@run_callback});

    % --- 3. HIỂN THỊ KẾT QUẢ ---
    % Panel chứa kết quả và đồ thị
    hPanelResult = uipanel('Position',[0.3, 0.05, 0.68, 0.85], 'BackgroundColor', 'white', 'BorderType', 'line');

    % Bảng kết quả
    uicontrol('Parent', hPanelResult, 'Style','text','String','4. KẾT QUẢ TÍNH TOÁN',...
        'Units', 'normalized', 'Position',[0.02, 0.95, 0.4, 0.04],'FontSize',11,'FontWeight','bold', 'HorizontalAlignment', 'left', 'BackgroundColor', 'white');
    hTable = uitable('Parent', hPanelResult, 'Units', 'normalized', 'Position',[0.02, 0.55, 0.96, 0.4]);
    
    % Đồ thị
    uicontrol('Parent', hPanelResult, 'Style','text','String','5. ĐỒ THỊ MINH HỌA',...
        'Units', 'normalized', 'Position',[0.02, 0.48, 0.4, 0.04],'FontSize',11,'FontWeight','bold', 'HorizontalAlignment', 'left', 'BackgroundColor', 'white');
    hAxGraph = axes('Parent', hPanelResult, 'Units','normalized','Position',[0.1, 0.08, 0.8, 0.4]);

    % Hiển thị giao diện
    f.Visible = 'on';

    % --- CÁC HÀM CALLBACK ---

    function popup_callback(source, ~)
        val = source.Value;
        switch val
            case 1 % Chuong 8: Lap don
                set(hText1, 'String', '1. Hàm g(x):'); set(hEdit1, 'String', '(pi - asin(x))/3'); set(hEdit1, 'Enable', 'on');
                set(hText2, 'String', '2. Giá trị đầu x0:'); set(hEdit2, 'String', '0.6'); set(hEdit2, 'Enable', 'on');
                set(hText3, 'String', '3. Sai số tol:'); set(hEdit3, 'String', '1e-5'); set(hEdit3, 'Enable', 'on');
            case 2 % Chuong 9: Cholesky Bai 1
                set(hText1, 'String', '1. Ma trận A:'); set(hEdit1, 'String', '[5 3 2 1; 3 6 1 2; 2 1 5 1; 1 2 1 6]'); set(hEdit1, 'Enable', 'on');
                set(hText2, 'String', '2. Vector b:'); set(hEdit2, 'String', '[1; 4; 7; 2]'); set(hEdit2, 'Enable', 'on');
                set(hText3, 'String', '3. (Không dùng)'); set(hEdit3, 'String', ''); set(hEdit3, 'Enable', 'off');
            case 3 % Chuong 9: Cholesky Bai 2
                set(hText1, 'String', '1. Ma trận A:'); set(hEdit1, 'String', '[4.9 1.0 0.1 1.1; 1.0 6.4 1.2 0.2; 0.1 1.2 3.6 1.1; 1.1 0.2 1.1 6.4]'); set(hEdit1, 'Enable', 'on');
                set(hText2, 'String', '2. Vector b:'); set(hEdit2, 'String', '[5.0; 2.2; 3.7; 2.2]'); set(hEdit2, 'Enable', 'on');
                set(hText3, 'String', '3. (Không dùng)'); set(hEdit3, 'String', ''); set(hEdit3, 'Enable', 'off');
            case 4 % Chuong 10: Noi suy Newton
                set(hText1, 'String', '1. Vector X:'); set(hEdit1, 'String', '[6.3 6.72 7.14 7.56 7.98 8.4]'); set(hEdit1, 'Enable', 'on');
                set(hText2, 'String', '2. Vector Y:'); set(hEdit2, 'String', '[21.4259 23.377 25.3622 27.3831 29.438 31.5253]'); set(hEdit2, 'Enable', 'on');
                set(hText3, 'String', '3. Điểm cần tính x*:'); set(hEdit3, 'String', '6.51'); set(hEdit3, 'Enable', 'on');
            case 5 % Chuong 11+12: Euler
                set(hText1, 'String', '1. Hàm f(x,y):'); set(hEdit1, 'String', '@(x,y) y-x'); set(hEdit1, 'Enable', 'on');
                set(hText2, 'String', '2. [x0, y0, h]:'); set(hEdit2, 'String', '[0, 1, 0.1]'); set(hEdit2, 'Enable', 'on');
                set(hText3, 'String', '3. x_end:'); set(hEdit3, 'String', '0.5'); set(hEdit3, 'Enable', 'on');
        end
    end

    function load_data_callback(~, ~)
        % Hàm này đơn giản là gọi lại popup callback để reset về giá trị mặc định
        popup_callback(hPopup, []);
    end

    function run_callback(~, ~)
        val = hPopup.Value;
        % Clear axes before plotting
        cla(hAxGraph); legend(hAxGraph, 'off'); title(hAxGraph, '');
        
        switch val
            case 1 % Chuong 8: Lap don
                run_lap_don();
            case 2 % Chuong 9: Cholesky Bai 1
                run_cholesky();
            case 3 % Chuong 9: Cholesky Bai 2
                run_cholesky();
            case 4 % Chuong 10: Noi suy Newton
                run_newton_interp();
            case 5 % Chuong 11+12: Euler
                run_euler();
        end
    end

    % --- CÁC HÀM XỬ LÝ LOGIC ---

    function run_lap_don()
        try
            g_str = get(hEdit1, 'String');
            g = str2func(['@(x)' g_str]);
            x0 = str2double(get(hEdit2, 'String'));
            tol = str2double(get(hEdit3, 'String'));
            
            % Thuat toan lap
            max_iter = 100;
            results = zeros(max_iter, 3); % [Step, x_new, error]
            x_old = x0;
            
            for k = 1:max_iter
                x_new = g(x_old);
                err = abs(x_new - x_old);
                results(k, :) = [k, x_new, err];
                if err < tol
                    results = results(1:k, :);
                    break;
                end
                x_old = x_new;
            end
            
            % Hien thi bang
            set(hTable, 'Data', results, 'ColumnName', {'Lần lặp', 'Nghiệm x', 'Sai số'});
            
            % Ve do thi
            x_graph = linspace(0.5, 1, 100);
            y1 = x_graph;
            try
                y2 = arrayfun(g, x_graph);
                axes(hAxGraph);
                plot(x_graph, y1, 'b-', 'LineWidth', 1.5); hold on;
                plot(x_graph, y2, 'r-', 'LineWidth', 1.5);
                plot(results(:,2), results(:,2), 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 6); % Cac diem lap
                legend('y = x', ['y = g(x)'], 'Quá trình lặp', 'Location', 'best');
                title('Đồ thị phương pháp Lặp đơn');
                xlabel('x'); ylabel('y');
                grid on; hold off;
            catch
                 msgbox('Không thể vẽ đồ thị hàm số phức tạp này, nhưng kết quả tính toán vẫn đúng.', 'Thông báo');
            end
            
        catch e
            errordlg(e.message, 'Lỗi nhập liệu');
        end
    end

    function run_cholesky()
        try
            A = str2num(get(hEdit1, 'String')); %#ok<*ST2NM>
            b = str2num(get(hEdit2, 'String'));
            
            n = size(A, 1);
            L = zeros(n, n);
            
            % Phan ra Cholesky
            for k = 1:n
                L(k, k) = sqrt(A(k, k) - sum(L(k, 1:k-1).^2));
                for i = k+1:n
                    L(i, k) = (A(i, k) - sum(L(i, 1:k-1) .* L(k, 1:k-1))) / L(k, k);
                end
            end
            
            % Giai Ly = b (Tien)
            y = zeros(n, 1);
            for i = 1:n
                y(i) = (b(i) - sum(L(i, 1:i-1)' .* y(1:i-1))) / L(i, i);
            end
            
            % Giai L'x = y (Lui)
            Lt = L';
            x = zeros(n, 1);
            for i = n:-1:1
                x(i) = (y(i) - sum(Lt(i, i+1:n)' .* x(i+1:n))) / Lt(i, i);
            end
            
            % Hien thi ket qua
            data_display = [(1:n)', x];
            set(hTable, 'Data', data_display, 'ColumnName', {'Index', 'Nghiệm x'});
            
            % Do thi truc quan nghiem (Bar plot)
            axes(hAxGraph);
            bar(x, 'FaceColor', [0 0.4470 0.7410]);
            title('Giá trị các nghiệm x');
            xlabel('Index (x_i)'); ylabel('Value');
            grid on;
            
        catch e
            errordlg(['Lỗi tính toán: ' e.message], 'Lỗi');
        end
    end

    function run_newton_interp()
        try
            X = str2num(get(hEdit1, 'String'));
            Y = str2num(get(hEdit2, 'String'));
            xp = str2double(get(hEdit3, 'String'));
            
            n = length(X);
            D = zeros(n, n);
            D(:, 1) = Y';
            
            % Bang sai phan
            for j = 2:n
                for i = 1:n-j+1
                    D(i, j) = D(i+1, j-1) - D(i, j-1); % Sai phan tien thong thuong
                end
            end
            
            % Tinh gia tri noi suy (Newton tien voi moc cach deu)
            h = X(2) - X(1);
            t = (xp - X(1)) / h;
            
            yp = D(1, 1);
            term = 1;
            
            % Hien thi cac buoc
            calc_steps = zeros(n, 2); % [Bac, Gia_tri_them_vao]
            calc_steps(1,:) = [0, yp];

            for k = 1:n-1
                term = term * (t - (k-1)) / k;
                add_val = term * D(1, k+1);
                yp = yp + add_val;
                calc_steps(k+1, :) = [k, yp];
            end
            
            set(hTable, 'Data', calc_steps, 'ColumnName', {'Bậc đa thức', 'Giá trị nội suy'});
            
            % Ve do thi
            axes(hAxGraph);
            plot(X, Y, 'bo-', 'LineWidth', 1.5, 'MarkerFaceColor', 'b'); hold on;
            plot(xp, yp, 'rx', 'MarkerSize', 12, 'LineWidth', 2);
            title(['Kết quả nội suy tại x = ' num2str(xp) ' là y = ' num2str(yp)]);
            legend('Dữ liệu gốc', 'Điểm nội suy', 'Location', 'best');
            xlabel('X'); ylabel('Y');
            grid on; hold off;
            
        catch e
            errordlg(e.message, 'Lỗi');
        end
    end

    function run_euler()
        try
            f_str = get(hEdit1, 'String');
            if startsWith(f_str, '@')
                f = str2func(f_str);
            else
                f = str2func(['@(x,y)' f_str]);
            end
            
            params = str2num(get(hEdit2, 'String'));
            x0 = params(1); y0 = params(2); h = params(3);
            x_end = str2double(get(hEdit3, 'String'));
            
            x = x0:h:x_end;
            n = length(x);
            y = zeros(1, n);
            y(1) = y0;
            
            % Bang ket qua chi tiet
            table_data = zeros(n, 4); % [i, xi, yi, f(xi,yi)]
            table_data(1, :) = [0, x(1), y(1), f(x(1), y(1))];
            
            for i = 1:n-1
                slope = f(x(i), y(i));
                y(i+1) = y(i) + h * slope;
                table_data(i+1, :) = [i, x(i+1), y(i+1), f(x(i+1), y(i+1))];
            end
            
            set(hTable, 'Data', table_data, 'ColumnName', {'i', 'xi', 'yi', 'f(xi,yi)'});
            
            % Ve do thi
            axes(hAxGraph);
            plot(x, y, 'r-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
            title('Nghiệm số bằng phương pháp Euler');
            xlabel('x'); ylabel('y');
            grid on;
            
        catch e
            errordlg(e.message, 'Lỗi');
        end
    end

end