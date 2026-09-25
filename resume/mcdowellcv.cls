%% The MIT License (MIT)
%%
%% Copyright (c) 2015 Daniil Belyakov
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all
%% copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%% SOFTWARE.

\ProvidesClass{mcdowellcv}[2022/03/18 v1.2.0 McDowell CV class]


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
% \RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
% \RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% % Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% % Needed to change line spacing in specific environment
% \RequirePackage{setspace}
% Needed to manage fonts
% \RequirePackage[quiet]{fontspec}
% % To support LaTeX quoting style
% \defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
% \RequirePackage{unicode-math}
% Needed to use icons from font-awesome (v5: bundles its own fonts, so no
% system font install is required)
\RequirePackage{fontawesome5}
% % Needed to deal a paragraphs
% \RequirePackage{parskip}
% NOTE: hyperref is loaded after \LoadClass (see below). Loading it before the
% base class clashes with article.cls on recent LaTeX -> "\maketitle already
% defined".

% Set up the fonts according to options
\def\mainfontsize{11pt}
% TeX Gyre Termes: a Times New Roman metric-compatible clone bundled with all
% TeX distributions (and Overleaf), so the document builds anywhere with no
% font install. Use the 'calibri' class option to override.
\def\mainfontface{TeX Gyre Termes}

\DeclareOption{calibri}{%
  \def\mainfontface{Calibri}
}

% Set up papersize according to options, default to US letter
\def\papersize{letterpaper}
%Set up bool for adjusting vspacing later
\newif\ifpapersize

\DeclareOption{a4paper}{%
  \def\papersize{a4paper}
  \papersizetrue
}

\DeclareOption{letterpaper}{%
  \def\papersize{letterpaper}
  \papersizefalse
}
\ProcessOptions\relax

% Set font size and paper type
\LoadClass[\papersize,\mainfontsize]{article}

% Set document margins
\usepackage[left=0.75in,top=0.6in,right=0.75in,bottom=0.6in]{geometry}

% Set font face
\usepackage{fontspec}
\ifdefstring{\mainfontface}{TeX Gyre Termes}{%
  % Load the bundled OTF by file name so it resolves from texmf on any system
  % (local and Overleaf), not only where the font is registered with the OS.
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    SmallCapsFeatures = {Renderer=Basic},
    Ligatures      = {TeX, NoCommon, NoDiscretionary},
  ]
}{%
  % System font (e.g. the 'calibri' class option) loaded by name
  \setmainfont[
    SmallCapsFeatures = {Renderer=Basic},
    Ligatures = {TeX, NoCommon, NoDiscretionary}
  ]{\mainfontface}
}

% Hyperlinks (loaded here, after \LoadClass, to avoid the article.cls clash)
\usepackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

% Remove paragraph indentation
\usepackage[parfill]{parskip}

% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{array}

% Required for ifthenelse statements
\usepackage{etoolbox}

% Suppress page numbers
\pagestyle{empty}

% For custom margins
\usepackage{changepage}

% To customize lists
\usepackage{enumitem}
% Remove left margin from lists, suppress vertical item separation and set top
% separation to a negative value to suppress a single parskip before lists
\setlist{leftmargin=*, noitemsep, topsep=-1\parskip}

% For adjusting spacing based on the platform used
\usepackage{ifthen}
\usepackage{ifplatform}

% For spcaed small caps
\usepackage{microtype}

\DeclareMicrotypeSet*{smallcapsi} {
  encoding = {OT1,T1,T2A,LY1,OT4,QX,T5,TS1,EU1,EU2},
  shape = {sc*,si,scit}
}

%--------------------------------------------------------------------------------
%                                   Constants                                   -
%--------------------------------------------------------------------------------

\ifthenelse{\equal{\platformname}{\notwindowsname}}{
  \def\namespaceskip{0.575em}
  \def\afterheaderspace{1.1pt}
  \def\beforesectionheaderspace{5pt}
  \def\sectionheadermargin{6pt}
  \def\beforesectionheaderhrulespace{2.85pt}
  \def\sectionheaderhrlueheight{0.518pt}
  \def\aftersectionheaderspace{-1.8pt}

  \ifpapersize
    \def\aftersinglelinesubsectionheaderspace{-5.75pt}
  \else
    \def\aftersinglelinesubsectionheaderspace{-20.25pt}
  \fi
  
  \def\afterdoublelinesubsectionheaderspace{-11.75pt}
  \def\aftermultilinesubsectionheaderspace{-7.75pt}
  \def\afteremptysubsectionheaderspace{1.25pt}
  \def\aftersubsectionheaderspace{-3.5pt}
  \def\subsectionmargin{9pt}
  \def\aftersubsectionspace{2.1pt}
}{
  \def\namespaceskip{0.4em}
  \def\afterheaderspace{3pt}
  \def\beforesectionheaderspace{4.75pt}
  \def\sectionheadermargin{6pt}
  \def\beforesectionheaderhrulespace{3pt}
  \def\sectionheaderhrlueheight{0.5pt}
  \def\aftersectionheaderspace{-4pt}
  
  \ifpapersize
    \def\aftersinglelinesubsectionheaderspace{-4pt}
  \else
    \def\aftersinglelinesubsectionheaderspace{-18.5pt}
  \fi

  \def\afterdoublelinesubsectionheaderspace{-10pt}
  \def\aftermultilinesubsectionheaderspace{-6pt}
  \def\afteremptysubsectionheaderspace{3pt}
  \def\aftersubsectionheaderspace{-3pt}
  \def\subsectionmargin{9pt}
  \def\aftersubsectionspace{4pt}
}

%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{1.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{0mm}


% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}



%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------

% \def\@googlescholar{https://scholar.google.com/citations?view_op=list_works&hl=en&user=yPs4CdMAAAAJ}{Publications}
% Define a header for CV
% Usage: \makecvheader
% Print the row of social links (used inside \makeheader).
\newcommand*{\makecvheader}[1][C]{%
  {\small
    \href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}%
      \acvHeaderSocialSep
    \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\acvHeaderIconSep\@linkedin}%
      \acvHeaderSocialSep
    \href{https://scholar.google.com/citations?user=\@googlescholarid}{\faGraduationCap\acvHeaderIconSep\@googlescholarname}%
  }%
}
%--------------------------------------------------------------------------------
%                            Header Setup and Printing                          -
%--------------------------------------------------------------------------------

% Address
\makeatletter

\newcommand\address[1]{\def\@address{#1}}
\address{}

\newcommand\printaddress{
  \small{\@address}
}

\makeatother

% Name
\makeatletter

\newcommand\name[1]{\def\@name{#1}}
\name{}

\newcommand\printname{
  \typeout {kokoko}
  \typeout \spaceskip
  \spaceskip \namespaceskip \relax
  \textbf{\LARGE{\textsc{\@name}}}
}

\makeatother

% Contacts
\makeatletter

\newcommand\contacts[1]{\def\@contacts{#1}}
\contacts{}

\newcommand\printcontacts{
  \small{\@contacts}
}

\makeatother

% Stacked, single-column header: name, then social links, then one contact
% line. No tables -> parsers read it top-to-bottom and detect the name first.
\makeatletter
\newcommand\makeheader{
  \begin{center}
    {\printname}\\[\acvHeaderAfterNameSkip]
    \makecvheader\\[\acvHeaderAfterPositionSkip]
    {\small \@address \quad\textbar\quad \@contacts}
  \end{center}
  \vspace*{\afterheaderspace}
}
\makeatother

%--------------------------------------------------------------------------------
%                            Sections and Subsections                           -
%--------------------------------------------------------------------------------

% Fine rule between consecutive titled entries of a section (never above the
% first). Built from vertical leaders + \vspace, i.e. glue only, so a page
% break discards it instead of stranding a rule at a page edge.
% Override any of these with \def in the .tex preamble.
\def\entryseparatorheight{0.3pt}
\def\entryseparatorcolor{black!35}
\def\beforeentryseparatorspace{2pt}
\makeatletter
\newif\ifcv@afterentry
\newcommand\cv@entryseparator{%
  \ifcv@afterentry
    \vspace{\beforeentryseparatorspace}%
    \leaders\vbox{\color{\entryseparatorcolor}%
      \hrule width \linewidth height \entryseparatorheight}%
      \vskip \entryseparatorheight
  \fi
  \global\cv@afterentrytrue
}
\makeatother

% Print a section header
\makeatletter
\newenvironment{cvsection}[1]{
  \global\cv@afterentryfalse
  \vspace*{\beforesectionheaderspace}
  % Set text margins to equal \tabcolsep (6pt by default)
  \begin{adjustwidth}{\sectionheadermargin}{\sectionheadermargin}
    \textsc{\textbf{#1}}
  \end{adjustwidth}
  \vspace*{\beforesectionheaderhrulespace}
  \hrule height \sectionheaderhrlueheight
  \vspace*{\aftersectionheaderspace}
}{}
\makeatother

% Print a subsection
\makeatletter
% Two-line entry header (parser-robust, no tables):
%   line 1: bold title (#2) on the left, dates (#4) flush right
%   line 2: organization / location (#3)
% The optional #1 (line count) is kept for backward compatibility but unused.
% parskip is zeroed locally so the two header lines sit tight; it is restored
% on group exit. \aftersubsectionheaderspace then trims (or pads) the gap
% between the organization line and the bullet list.
\newenvironment{cvsubsection}[4][1]{
  \notblank{#2#3#4}{%
    \par\cv@entryseparator\vspace*{6pt}%
    \begingroup\setlength{\parskip}{0pt}%
      \noindent\textbf{#2}\hfill #4\par
      \notblank{#3}{#3\par}{}%
    \endgroup
    \vspace*{\aftersubsectionheaderspace}%
  }{%
    \vspace*{\afteremptysubsectionheaderspace}%
  }%
  \begin{adjustwidth}{\subsectionmargin}{\subsectionmargin}
}
{
  \end{adjustwidth}
  \vspace*{\aftersubsectionspace}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
