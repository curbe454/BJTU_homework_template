\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjtuhw}

% inherit from ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[UTF8]{ctexart}

% require package
\RequirePackage{geometry}

\RequirePackage{xcolor}
\RequirePackage{eso-pic}
\RequirePackage{xfakebold}

% code color requires package xcolor and python package Pygments
% need to compile twice
\RequirePackage{minted}
\setminted{frame=single}

\RequirePackage{graphics}


\geometry{a4paper,scale=0.8}

% 正文格式
\AtBeginDocument{
	\zihao{4}
}

% 各级别标题格式
\ctexset{
	section = {
	  format = \raggedright\zihao{4}\setBold,
	  % name = {第,节},        % 修改标题编号格式
	  % number = \chinese{section}, % 使用中文数字编号
	  % aftername = ~,         % 编号和标题内容之间的间距
	  % beforeskip = 1.0ex plus 0.2ex minus .2ex, % 段前间距
	  % afterskip = 1.0ex plus .2ex, % 段后间距
	 },
}

% 水印
\RequirePackage{draftwatermark}
\SetWatermarkText{\@studentid\@author}
\SetWatermarkScale{0.5}
\SetWatermarkLightness{0.8} % Set transparency (0 = dark, 1 = light)

% maketitle
\newcommand{\@department}{\relax}
\newcommand{\@studentid}{\relax}
\newcommand{\@supervisor}{\relax}
\newcommand{\@faculty}{\relax}

\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}

% 定义背景颜色（可选）
\definecolor{titlebg}{RGB}{41,128,185}

\renewcommand{\maketitle}{
	\begin{titlepage}
		% 添加背景色（可选）
		\AddToShipoutPictureBG*{
			\color{titlebg!15}
			\AtPageLowerLeft{\hspace{-9pt} % 微调位置
				\rule{\paperwidth}{\paperheight}}
		}

		\centering

		\includegraphics{img/logo.png}
		\vspace{4cm}

		\setBold
		{\zihao{2} \@title \par}
		\unsetBold

		\vfill

		\vspace{4cm}
		{\zihao{3}\hspace{-2cm}
			\begin{tabular}{r l}
				姓　　名: & \@author    \\
				学　　号: & \@studentid \\
				% 指导教师: & \@supervisor
			\end{tabular}
		}

		\vfill

		\ifx\@faculty\relax\else
		{\zihao{3} \@faculty}
		\vspace{0.5cm}
		\ifx\@department\relax\else
			{\@department}
		\fi
		\fi

		{\zihao{-3} \@date}
	\end{titlepage}

	% 重置背景图片
	\ClearShipoutPictureBG
}

% vim: set fdm=marker
