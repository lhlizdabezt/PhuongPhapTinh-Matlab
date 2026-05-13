<p align="center">
  <img src="docs/banner.svg" alt="Numerical Methods and MATLAB — Cholesky / Newton Interp / Euler ODE / Fixed-Point Iter — HCMUS FETEL" width="100%" />
</p>

<h2 align="center">🧮 Phương Pháp Tính và MATLAB — Bài tập về nhà + Báo cáo giữa kỳ 🧮</h2>

<p align="center">
  <img src="https://img.shields.io/badge/Môn%20học-Phương%20pháp%20tính%20%26%20MATLAB-D95319?style=for-the-badge" alt="Môn học" />
  <img src="https://img.shields.io/badge/MATLAB-R2020a%2B-0076A8?style=for-the-badge&logo=mathworks&logoColor=white" alt="MATLAB" />
  <img src="https://img.shields.io/badge/Methods-5%20Numerical-2563eb?style=for-the-badge" alt="5 methods" />
  <img src="https://img.shields.io/badge/UI-MATLAB%20GUIDE-7c3aed?style=for-the-badge" alt="GUI" />
  <img src="https://img.shields.io/badge/Status-Báo%20cáo%20giữa%20kỳ-22c55e?style=for-the-badge" alt="Midterm submitted" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SV-Lương%20Hải%20Long-003366?style=flat-square" alt="SV" />
  <img src="https://img.shields.io/badge/MSSV-22207056-2563eb?style=flat-square" alt="MSSV" />
  <img src="https://img.shields.io/badge/Lớp-23DTV__CLC1-0f766e?style=flat-square" alt="Class" />
  <img src="https://img.shields.io/badge/Trường-HCMUS%20FETEL-D95319?style=flat-square" alt="HCMUS FETEL" />
</p>

<p align="center">
  <a href="https://github.com/lhlizdabezt/PhuongPhapTinh-Matlab">
    <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=18&duration=3500&pause=900&color=D95319&center=true&vCenter=true&multiline=true&width=860&height=70&lines=Cholesky+decomposition+%E2%80%A2+Newton+forward+interpolation+%E2%80%A2+Euler+ODE+solver;Fixed-point+iteration+%E2%80%A2+MATLAB+GUI+with+live+plot+%26+iteration+table" alt="Motion tagline" />
  </a>
</p>

---

## 🎯 Tổng quan

Repository tổng hợp **bài tập về nhà (BTVN)** và **báo cáo giữa kỳ** của môn **Phương pháp tính và MATLAB** — Khoa Điện tử Viễn thông, HCMUS:

- 📕 **Bài tập 1** — Bài tập về nhà cá nhân, trình bày tay (PDF scan).
- 🖥️ **Bài tập 2 — Báo cáo giữa kỳ** — **MATLAB GUI ~335 dòng** triển khai 5 thuật toán giải tích số có giao diện trực quan: chọn bài → nhập dữ liệu mẫu / tự nhập → bấm RUN → xem bảng lặp + đồ thị minh hoạ.

> 🧠 **Mục tiêu:** không chỉ chứng minh nắm vững công thức toán, mà còn **đóng gói thuật toán thành ứng dụng có giao diện** — đúng tinh thần kỹ thuật của môn (tính + lập trình).

---

## 📑 Mục lục

- [Tóm tắt 5 phương pháp số](#-tóm-tắt-5-phương-pháp-số-trong-báo-cáo-giữa-kỳ)
- [Cây thư mục](#-cây-thư-mục)
- [Cách chạy MATLAB GUI](#️-cách-chạy-matlab-gui)
- [Giao diện ứng dụng](#-giao-diện-ứng-dụng)
- [Dữ liệu mẫu kèm sẵn](#-dữ-liệu-mẫu-kèm-sẵn-trong-popup)
- [Tài liệu môn học gốc](#-tài-liệu-môn-học-gốc--academic-evidence)
- [Bản quyền &amp; học thuật](#-bản-quyền--học-thuật)

---

## 🧮 Tóm tắt 5 phương pháp số trong báo cáo giữa kỳ

<table>
  <thead>
    <tr>
      <th>#</th>
      <th>Chương / Bài</th>
      <th>Phương pháp</th>
      <th>Ý tưởng cốt lõi</th>
      <th>Đầu vào</th>
      <th>Đầu ra</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center"><b>1</b></td>
      <td>Chương 8 — Bài 3.2</td>
      <td><b>Lặp đơn</b> (Fixed-point iteration)</td>
      <td>Đưa <code>f(x)=0</code> về <code>x = g(x)</code>, lặp <code>x_{n+1} = g(x_n)</code> đến khi <code>|x_{n+1} − x_n| &lt; tol</code></td>
      <td><code>g(x)</code>, <code>x0</code>, <code>tol</code></td>
      <td>Bảng các vòng lặp + đồ thị <code>y=x</code>, <code>y=g(x)</code>, các điểm hội tụ</td>
    </tr>
    <tr>
      <td align="center"><b>2</b></td>
      <td>Chương 9 — Bài 4.3 — Bài 1</td>
      <td><b>Phân rã Cholesky</b></td>
      <td>Phân rã ma trận <b>SPD</b> thành <code>A = L·Lᵀ</code>, giải <code>Ly = b</code> rồi <code>Lᵀx = y</code></td>
      <td>Ma trận <code>A</code> (4×4), vector <code>b</code></td>
      <td>Vector nghiệm <code>x</code> + bar chart minh hoạ</td>
    </tr>
    <tr>
      <td align="center"><b>3</b></td>
      <td>Chương 9 — Bài 4.3 — Bài 2</td>
      <td><b>Phân rã Cholesky</b> (ví dụ 2)</td>
      <td>Như trên, ma trận 4×4 khác — kiểm tra robustness của thuật toán</td>
      <td>Ma trận <code>A</code> (4×4), vector <code>b</code></td>
      <td>Vector nghiệm <code>x</code> + bar chart</td>
    </tr>
    <tr>
      <td align="center"><b>4</b></td>
      <td>Chương 10 — Bài 5.8</td>
      <td><b>Nội suy Newton</b> (forward, mốc cách đều)</td>
      <td>Lập bảng sai phân tiến, tính <code>P(x*) = y₀ + tΔy₀ + t(t−1)/2!·Δ²y₀ + …</code></td>
      <td>Vector <code>X</code>, <code>Y</code>, điểm cần nội suy <code>x*</code></td>
      <td>Bảng giá trị nội suy theo bậc đa thức + đồ thị điểm dữ liệu &amp; điểm nội suy</td>
    </tr>
    <tr>
      <td align="center"><b>5</b></td>
      <td>Chương 11–12 — Bài 6.6</td>
      <td><b>Euler tiến</b> (giải ODE bậc 1)</td>
      <td>Cho <code>y' = f(x,y)</code>, lặp <code>y_{i+1} = y_i + h·f(x_i, y_i)</code></td>
      <td><code>f(x,y)</code>, <code>[x0, y0, h]</code>, <code>x_end</code></td>
      <td>Bảng <code>(i, xᵢ, yᵢ, f(xᵢ,yᵢ))</code> + đồ thị nghiệm số</td>
    </tr>
  </tbody>
</table>

---

## 🗂️ Cây thư mục

```text
PhuongPhapTinh-Matlab/
├── README.md
├── LICENSE
├── .gitignore
├── docs/
│   └── banner.svg                                # Banner README (self-hosted)
│
├── LuongHaiLong_22207056_BaiTap_1.pdf            # 📕 BTVN 1 (bài tập tay, scan PDF)
│
└── LuongHaiLong_22207056_BaiTap_2/               # 🖥️ Báo cáo giữa kỳ — MATLAB GUI
    ├── LuongHaiLong_22207056_BaiTap_2.m          # 335 dòng MATLAB: GUI + 5 thuật toán
    └── LuongHaiLong_22207056_BaiTap_2.jpg        # Ảnh sinh viên (hiển thị trong panel info)
```

---

## 🛠️ Cách chạy MATLAB GUI

### 1. Yêu cầu

- **MATLAB** R2020a hoặc mới hơn (đã test với GUIDE legacy components: `uicontrol`, `uipanel`, `uitable`, `axes`)
- Không cần toolbox đặc biệt — toàn bộ phép tính dùng các phép cơ bản: `sqrt`, `linspace`, `str2num`, `str2func`, `arrayfun`, `plot`, `bar`

### 2. Chạy

```matlab
% Trong MATLAB, di chuyển đến thư mục Bài tập 2
cd('LuongHaiLong_22207056_BaiTap_2')

% Gọi hàm GUI (file phải có cùng tên với function bên trong)
LuongHaiLong_22207056_BaiTap_2
```

GUI window sẽ mở ra:

1. Cột trái — panel `THÔNG TIN SINH VIÊN` (ảnh + tên + MSSV + lớp).
2. Dưới đó — `popup chọn bài toán` (5 lựa chọn) + ô nhập dữ liệu + 2 nút `Load Data Mẫu` / `RUN`.
3. Cột phải — `bảng kết quả` (uitable) + `đồ thị minh hoạ` (axes).

### 3. Workflow điển hình

```
Chọn bài (popup) → Bấm "Load Data Mẫu" (auto-fill ví dụ giáo trình)
→ Bấm "RUN" → Đọc bảng iter / nghiệm → Xem đồ thị → Đối chiếu công thức tay
```

---

## 🖼️ Giao diện ứng dụng

GUI được thiết kế theo bố cục **bảng báo cáo** (giống biểu mẫu HCMUS):

| Khu vực | Chức năng |
| ------- | --------- |
| **1. Thông tin sinh viên** | Ảnh thẻ + Họ tên + MSSV + Lớp (góc trái trên) |
| **2. Chọn bài toán** | Popup 5 mục — chuyển ngữ cảnh nhập liệu tự động qua `popup_callback` |
| **3. Dữ liệu đầu vào** | 3 ô edit động — đổi label/giá trị theo bài chọn |
| **4. Kết quả tính toán** | `uitable` — cột phụ thuộc thuật toán (Lần lặp/Nghiệm/Sai số, Index/Nghiệm, Bậc/Giá trị, i/xᵢ/yᵢ/f) |
| **5. Đồ thị minh họa** | `axes` — line plot / bar plot / scatter overlay tùy thuật toán |

Tất cả callback (`popup_callback`, `load_data_callback`, `run_callback`) đều **bọc trong `try/catch`** với `errordlg` rõ ràng — nhập sai cú pháp không sập app.

---

## 📊 Dữ liệu mẫu kèm sẵn trong popup

| Bài | Dữ liệu mặc định khi bấm "Load Data Mẫu" |
| --- | ----------------------------------------- |
| 1   | `g(x) = (pi - asin(x))/3`, `x0 = 0.6`, `tol = 1e-5` |
| 2   | `A = [5 3 2 1; 3 6 1 2; 2 1 5 1; 1 2 1 6]`, `b = [1; 4; 7; 2]` |
| 3   | `A = [4.9 1.0 0.1 1.1; 1.0 6.4 1.2 0.2; 0.1 1.2 3.6 1.1; 1.1 0.2 1.1 6.4]`, `b = [5.0; 2.2; 3.7; 2.2]` |
| 4   | `X = [6.3 6.72 7.14 7.56 7.98 8.4]`, `Y = [21.4259 23.377 25.3622 27.3831 29.438 31.5253]`, `x* = 6.51` |
| 5   | `f(x,y) = y - x`, `[x0, y0, h] = [0, 1, 0.1]`, `x_end = 0.5` |

---

## 📖 Tài liệu môn học gốc / Academic evidence

| File                                                | Nội dung                                                            |
| --------------------------------------------------- | ------------------------------------------------------------------- |
| `LuongHaiLong_22207056_BaiTap_1.pdf`                | **BTVN 1** — bài tập về nhà cá nhân (PDF scan)                       |
| `LuongHaiLong_22207056_BaiTap_2/*.m`                | **Báo cáo giữa kỳ** — mã nguồn MATLAB GUI (5 phương pháp số)        |
| `LuongHaiLong_22207056_BaiTap_2/*.jpg`              | Ảnh sinh viên dùng trong panel "Thông tin sinh viên" của GUI         |

> 📝 Tên file giữ nguyên theo định dạng nộp bài chính thức của Khoa (`<Họ_tên>_<MSSV>_<bài>`).
> Vì hàm MATLAB phải có tên file trùng tên function bên trong (`function LuongHaiLong_22207056_BaiTap_2`), **không được rename** file `.m` này.

---

## 🔗 Liên quan / See also

- 📡 [`TruyenThongSo`](https://github.com/lhlizdabezt/TruyenThongSo) — Truyền thông số (MATLAB) — AWGN, BER, QPSK, LDPC
- 🔌 [`ThucHanhDienTuTuongTu`](https://github.com/lhlizdabezt/ThucHanhDienTuTuongTu) — Thực hành Điện tử Tương tự (LTspice, LM324/LM339/NE555)
- 🧠 [`embedded-systems-fpga-review-labs`](https://github.com/lhlizdabezt/embedded-systems-fpga-review-labs) — Hệ thống nhúng FPGA (Quartus, Verilog, Nios II)
- 📚 [`HCMUS-DTVT-BaoCao-Templates`](https://github.com/lhlizdabezt/HCMUS-DTVT-BaoCao-Templates) — Templates KLTN/BCTT + Typst Guide

---

## ⚖️ Bản quyền &amp; học thuật

- **Mã MATLAB** (`LuongHaiLong_22207056_BaiTap_2.m`), **README**, **banner** và **bài làm tay** trong `BaiTap_1.pdf`: © 2026 **Lương Hải Long** (MSSV `22207056`). MIT — xem [LICENSE](LICENSE).
- **Đề bài** (Chương 8 Bài 3.2, Chương 9 Bài 4.3, Chương 10 Bài 5.8, Chương 11–12 Bài 6.6): thuộc bản quyền **giáo trình môn Phương pháp tính &amp; MATLAB**, Khoa Điện tử Viễn thông — HCMUS. Trích đề bài trong README chỉ với mục đích đối chiếu kết quả.
- **Ảnh chân dung** (`*.jpg`): © Lương Hải Long — chỉ dùng làm illustration trong panel "Thông tin sinh viên" của GUI báo cáo.

> ⚠️ **Lưu ý đạo đức học thuật:** không copy mã nguồn này nộp lại như báo cáo của bạn. Đây là sản phẩm cá nhân được public để minh chứng trải nghiệm môn học và làm tài liệu tham khảo cho khoá sau.

---

<p align="center">
  <sub>🧮 HCMUS · FETEL · Phương pháp tính &amp; MATLAB · Lương Hải Long · 22207056</sub>
</p>

<p align="center">
  <i>&ldquo;Từ công thức giáo trình đến GUI MATLAB — chọn bài, bấm RUN, đối chiếu đồ thị.&rdquo;</i>
</p>
