%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``CityUHK Thesis''                                                   %%
%%                                                                            %%
%% A PhD thesis LaTeX template for City University of Hong Kong               %%
%%                                                                            %%
%% Version: v2025.06.14                                                       %%
%% Author: Hu Wan                                                             %%
%% Department of Computer Science, City University of Hong Kong               %%
%% Email: hu.wan@my.cityu.edu.hk                                              %%
%% License: MIT License                                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{2025.06.14}
\newcommand\filedate{2025/06/14}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CityUHKThesis}[\filedate\space A PhD thesis class file (v\fileversion)]

% ******************************* Chapter Style *********************************
\newif\ifuseFancyChap\useFancyChapfalse     % Fancy Chapter Style
\DeclareOption{fancychap}{\useFancyChaptrue}

% ************************* Header / Footer Styling ****************************
\newif\ifPHD@textJustify\PHD@textJustifytrue % Set Justification true
\DeclareOption{flushleft}{\PHD@textJustifyfalse}

% *************************** Pre-defined Options ******************************
% Font Size
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}%
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}%

% Page Size
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper
\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% Generates Warning for unknown options
\DeclareOption*{
  \ClassWarning{CityUHKThesis}{Unknown option '\CurrentOption'. 
    Trying to pass to book class.}
  \PassOptionsToClass{\CurrentOption}{book}
}

% Process options and load class
\ProcessOptions\relax%
\LoadClass{book}%

% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************

% ************************** Layout and Formatting *****************************
\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
\RequirePackage{calc}     % calculate vertical spacing

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX

% ********* Information on Qualifying Panel and Examination Panel **************
\RequirePackage{pdfpages} % insert PDF document
\RequirePackage{etoolbox}

% *********************** Table of Contents & Appendices ***********************
\RequirePackage[nottoc]{tocbibind}
\RequirePackage[title,titletoc]{appendix}

\renewcommand{\contentsname}{Contents}
\renewcommand{\listfigurename}{List of figures}
\renewcommand{\listtablename}{List of tables}

% Hides Contents appearing from TOC, but adds it to bookmarks
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{Contents}
  \temptableofcontents
}

% *************************** Graphics and Figures *****************************
\RequirePackage{graphicx}

% ********************************** Fonts **********************************
\RequirePackage{amsmath}
\RequirePackage{fontspec}
\usepackage[T1]{fontenc}

% Chinese support - PMingLiU.ttf is required
\newfontfamily\mingliu{[PMingLiU.ttf]}
\newcommand\chinese[1]{{\mingliu #1}}

\newfontfamily\timesnewroman{Times New Roman}
\newcommand\english[1]{{\timesnewroman #1}}

% Main font setup - simple and reliable
\setmainfont[Mapping=ligatures]{Times New Roman}

% Compile-time optimizations
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\brokenpenalty=10000

% ******************************* Hyperref Setup ********************************
\RequirePackage[unicode=true]{hyperref}
\hypersetup{
  final=true,
  plainpages=false,
  pdfstartview=FitV,
  pdftoolbar=true,
  pdfmenubar=true,
  bookmarksopen=true,
  bookmarksnumbered=true,
  breaklinks=true,
  colorlinks=true,
  linkcolor=black,
  urlcolor=black,
  citecolor=black,
  anchorcolor=black
}

% ******************************* Page Layout ********************************
\RequirePackage[paper=\PHD@papersize,nomarginpar,
  tmargin=38mm,bmargin=38mm,lmargin=32.7mm,rmargin=32.7mm]{geometry}

% ************************ URL Package and Definition **************************
\RequirePackage{url}
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************

% *************************** Setting PDF Meta-Data ****************************
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords}
  }
}

% ******************************** Line Spacing ********************************
\renewcommand\baselinestretch{1.2}

% ******************************** Justification *******************************
\ifPHD@textJustify
\else
\AtBeginDocument{\raggedright}
\fi

% ************************** TOC and Hide Sections *****************************
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{
	\bgroup\let
	\addcontentsline=\nocontentsline#1{#2}
	\egroup}

% ***************************** Header Formatting ******************************
\RequirePackage{fancyhdr}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\pagestyle{plain}
\setlength{\headheight}{14.5pt}

% ***************************** Page Handling Commands ******************************
% Enhanced \cleardoublepage with centered empty page
\def\cleardoublepage{\clearpage\if@twoside%
    \ifodd\c@page\else
    \vspace*{\fill}
    \hfill
    \begin{center}
    \end{center}
    \vspace{\fill}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

% Completely empty double page
\def\cleardoublepageempty{\clearpage\if@twoside
    \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

% Ensure phantomsection is available
\providecommand\phantomsection{}

% **************************** Chapter title style *****************************
\ifuseFancyChap
  \usepackage[Lenny]{fncychap}
  \ChNameVar{\fontsize{14}{16}\usefont{OT1}{ptm}{m}{n}\selectfont}
  \ChNameUpperCase
  \ChTitleVar{\LARGE\bfseries}
\fi

% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************

% Author name in Chinese
\newcommand{\@authorzh}{}
\newcommand{\authorzh}[1]{\renewcommand{\@authorzh}{#1}}

% Title in Chinese
\newcommand{\@titlezh}{}
\newcommand{\titlezh}[1]{\renewcommand{\@titlezh}{#1}}

% The year and term the degree will be officially conferred
\newcommand{\@degreedate}{\monthname[\the\month]\space\the\year}
\newcommand{\degreedate}[1]{\renewcommand{\@degreedate}{#1}}
\newcommand{\@degreedatezh}{}
\newcommand{\degreedatezh}[1]{\renewcommand{\@degreedatezh}{#1}}

% The full and abbreviated name of the degree
\newcommand{\@degreetitle}{}
\newcommand{\degreetitle}[1]{\renewcommand{\@degreetitle}{#1}}
\newcommand{\@degreetitlezh}{}
\newcommand{\degreetitlezh}[1]{\renewcommand{\@degreetitlezh}{#1}}
\newcommand{\@degreetitleabbr}{}
\newcommand{\degreetitleabbr}[1]{\renewcommand{\@degreetitleabbr}{#1}}

% The name of your department
\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}
\newcommand{\@deptzh}{}
\newcommand{\deptzh}[1]{\renewcommand{\@deptzh}{#1}}

% The name of your University
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\@universityzh}{}
\newcommand{\universityzh}[1]{\renewcommand{\@universityzh}{#1}}
\newcommand{\@universityabbr}{}
\newcommand{\universityabbr}[1]{\renewcommand{\@universityabbr}{#1}}
\newcommand{\@partneruniversity}{}
\newcommand{\partneruniversity}[1]{\renewcommand{\@partneruniversity}{#1}}

% Submission Text
\newcommand{\submissiontexta}{Submitted to}
\newcommand{\submissiontextb}{in Partial Fulfillment of the Requirements\par for the Degree of\space}
\newcommand{\submissiontextc}{awarded by City University of Hong Kong\par for successful completion of the joint programme with\par\space}

% Keywords and subject
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

% Title texts
\newcommand{\@declarationtitle}{Declaration}
\newcommand{\@acknowledgementstitle}{Acknowledgements}
\newcommand{\@abstracttitle}{Abstract}
\newcommand{\@panelname}{Qualifying Panel and Examination Panel}
\newcommand{\pubname}{Publications}

% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% ******************************************************************************
% *************************** Front Matter Layout ******************************
% ******************************************************************************

% ******************************** Title Page **********************************
\newcommand{\smallfontsize}   {\fontsize{12bp}{14bp} \selectfont}
\newcommand{\normalfontsize}  {\fontsize{14bp}{16bp} \selectfont}
\newcommand{\largefontsize}   {\fontsize{16bp}{18bp} \selectfont}
\newcommand{\Largefontsize}   {\fontsize{18bp}{20bp} \selectfont}
\newcommand{\LARGEfontsize}   {\fontsize{20bp}{22bp} \selectfont}

\renewcommand{\maketitle}{
\newgeometry{left=45mm,right=45mm,top=50mm,bottom=50mm,noheadfoot,nomarginpar}
\thispagestyle{empty}

\begin{spacing}{1}
\begin{center}

% University
{\Largefontsize
  {\expandafter\MakeUppercase\expandafter{\english\@university} \par}
  {\chinese \@universityzh \par}
  \vspace{54bp}
  % Title
  {\english \@title \par}
  {\chinese \@titlezh \par}
}

\vspace{36bp}

% Submission Text
{\smallfontsize
  {\english \submissiontexta \par}
  {\english \@dept \par}
  {\chinese \@deptzh \par}
  {\english \submissiontextb \english \@degreetitle \par}
  {\chinese \@degreetitlezh \par}
    \ifthenelse{\equal{\@partneruniversity}{}}{
      % partneruniversity is not defined
      \vspace{48bp}
    }{
      {\english \submissiontextc \english \@partneruniversity\par}
      \vspace{12bp}
    }

  {\english {by}}
\vspace{24bp}

  % Author
  {\english \@author \par}
  {\chinese \@authorzh \par}

\vspace{24bp}

  %Degree date
  {\english \@degreedate \par}
  {\chinese \@degreedatezh \par}
}

\end{center}
\end{spacing}
\restoregeometry
}

% ********************************* Dedication *********************************
\newenvironment{dedication}
{
\cleardoublepage
\vspace*{0.2\textheight}
\phantomsection
\thispagestyle{empty}
\centering
}

% ****************************** Abstract ********************************
\newenvironment{abstract} {
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@abstracttitle}
\chapter*{\@abstracttitle}
\pagestyle{plain}
}

% *********** Information on Qualifying Panel and Examination Panel ************
\newcommand{\tinyfontsize}   {\fontsize{11.3bp}{12bp} \selectfont}
\newlength\mystoreparindent
\newenvironment{panel}
{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@panelname}
\setlength{\mystoreparindent}{\the\parindent}
\setlength{\parindent}{0pt}

\begin{center}
\textbf{CITY UNIVERSITY OF HONG KONG} \\
\textbf{Qualifying Panel and Examination Panel}
\end{center}

\begin{spacing}{1.5}
\tinyfontsize
\setlength{\tabcolsep}{0pt}
}{%
\end{spacing}
\setlength{\parindent}{\mystoreparindent}
}
\BeforeBeginEnvironment{panel}{\newgeometry{left=45mm,right=45mm,top=25mm,nohead,nomarginpar}
\fancyfootoffset[L]{0mm}
\thispagestyle{plain}
}
\AfterEndEnvironment{panel}{\restoregeometry}

% ***************************** Acknowledgements *****************************
\newenvironment{acknowledgements}{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\@acknowledgementstitle}
\chapter*{\@acknowledgementstitle}
\thispagestyle{plain}
}

% ****************************** Publications ********************************
\newenvironment{publications}{
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\pubname}
\chapter*{\pubname}
\thispagestyle{plain}
}

%% EOF