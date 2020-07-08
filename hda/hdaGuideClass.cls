%%
%% TODO
%% ---bilder
%% ---tabellen
%% ---datatool
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hda/hdaGuideClass}
              [2020/05/24 v2.5
Sielhorst iT Beratung UG: guide class by jonathan sielhorst / manfred sielhorst]

\@twosidetrue%
\@mparswitchtrue%
\@twocolumnfalse%
\setlength\overfullrule{2pt}%
\newcommand\@ptsize{0}% %option 1 oder 2
\setlength\paperheight {297mm}% seitenhöhe
\setlength\paperwidth  {210mm}% seitenbreite
\newcommand{\sitHrule}{{\color{sitBlue}\hrule height 1.4pt}}
\newcommand{\textsize}{1\@ptsize pt}
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\parindent{0pt}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{2\p@ \@plus \p@}
\@lowpenalty  51
\@medpenalty  151
\@highpenalty 301
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variablen dokumentübergreifend können mit \printXXX aufgerufen werden
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printTitel}[1]{#1}
\newcommand{\printSubtitel}[1]{#1}
\newcommand{\printDatum}[1]{#1}
\newcommand{\printAutor}[1]{#1}
\newcommand{\printVersion}[1]{#1}
\newcommand{\printCopyright}[1]{#1}

\newcommand{\sitTitel}[1]{\renewcommand{\printTitel}{#1}}
\newcommand{\sitSubtitel}[1]{\renewcommand{\printSubtitel}{#1}}
\newcommand{\sitAutor}[1]{\renewcommand{\printAutor}{#1}}
\newcommand{\sitVersion}[1]{\renewcommand{\printVersion}{#1}}
\newcommand{\sitDatum}[1]{\renewcommand{\printDatum}{#1}}
\newcommand{\sitCopyright}[1]{\renewcommand{\printCopyright}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%-- TitelLogo auswahl / definition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printHeaderLogo}{hda/pp/hda/img/hda-fbi-logo}

\newcommand{\sitHeaderLogo}[1]{%
  \ifthenelse{\equal{#1}{hdaLogo}}%
    {\renewcommand{\printHeaderLogo}{hda/pp/hda/img/hda-logo}}%
    {\ifthenelse{\equal{#1}{fbeLogo}}%
      {\renewcommand{\printHeaderLogo}{hda/pp/hda/img/hda-fbe-logo}}%
      {\renewcommand{\printHeaderLogo}{hda/pp/hda/img/hda-fbi-logo}}%
    }%
}

\newcommand{\printLogo}{none}

\newcommand{\sitTitlePageLogo}[1]{%
    \ifthenelse{\equal{#1}{hdaLogo}}%
      {\renewcommand{\printLogo}{hda/pp/hda/img/hda-logo}}%
        {\ifthenelse{\equal{#1}{fbeLogo}}%
          {\renewcommand{\printLogo}{hda/pp/hda/img/hda-fbe-logo}}%
          {\ifthenelse{\equal{#1}{fbiLogo}}%
            {\renewcommand{\printLogo}{hda/pp/hda/img/hda-fbi-logo}}%
            {\renewcommand{\printLogo}{#1}}%
          }%
        }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dokumentstruktur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\part NICHT BENUTZTEN.
%% unterdrück Fehlermeldung durch minitoc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\part}[1]{#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\chapter{Name} neue kapitelseite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\chapter{\clearpage
                    \ifodd\thepage {} \else {\newpage\null\thispagestyle{empty}\null\clearpage\null} \fi%
                    \thispagestyle{plain}%
%                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Kapitel wird ins inahltsverzeichnis eingefügt
%% und space wird in listoffigures und listoftables eingefügt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% alternaive zum space im lot/lof
%% kann auch kapitelnummer. Name eingefügt werden
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%										\typeout{\@chapapp\space\thechapter.}%
%                   \addcontentsline{lof}{chapter}%
%                   {\protect\numberline{\thechapter}#1}
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \null\vfill
                    \begin{center}
                      \@makechapterhead{#2}%
                     \end{center}
                     \vskip 50\p@%
                      \minitoc \mtcskip
                     \null\vfill
                      \clearpage
                      {\normalfont\LARGE\bfseries \thechapter\ #2}
                      \vskip 20\p@%
                      \@afterheading}
\def\@makechapterhead#1{%
  {%
		\sitHrule
		\vskip 20\p@
    \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 20\p@
    \sitHrule
  }%
}
\def\@schapter#1{%
                   \@makeschapterhead{#1}%
                   \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@%
  }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% weitere struktur typen werden definiert
%% nicht so kompliziert wie chapter ;)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  --Auflistung
%% einrückung
%% und typen werden definiert
%% itemtype werden später in settings mit bilder versehen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  --Umgebungen
%% TITELSEITE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{titlepage}
    {%
      \newpage
      \thispagestyle{myplain}%
    }%
    {%
    \newpage%
    \clearpage
    }%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DOCUMENTINFOSEITE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{docuinfo}
		{%
			\newpage
			\thispagestyle{myheadings}
		}%
		{%
			\clearpage
		}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DOKUMENTKOPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{sithead}
		{%
			\pagenumbering{Roman}
%			\setcounter{page}{1}
		}%
		{%
			\null%
			\null%
			\thispagestyle{empty}%
			\ifodd\value{page} {} \else {\null\clearpage} \fi%
		}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DOKUMENTBODY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{sitContent}
		{%
			\newcounter{tmppage}{}
			\setcounter{tmppage}{\value{page}}
%			\newpage
			\pagenumbering{arabic}
			\setcounter{page}{\value{tmppage}}
		}
		{%
		
		}%

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CAPITONS FÜR BILD/TABELLENUMGEBUNG
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SCHRIFTTYPEN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand{\bibtex}{\textsc{BIB}\TeX}
\newcommand{\latex}{\LaTeX}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIGUREN - BILDERUMGEBUNG floating
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{figure}[chapter]
\renewcommand \thefigure{\thechapter.\@arabic\c@figure}
\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}

\newenvironment{figure}
               {\@float{figure}%
               \begin{center}}
               {\end{center}%
               \end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABELLEN - UMGEUNG floating
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{table}[chapter]
\renewcommand\thetable{\thechapter.\@arabic\c@table}

\def\fps@table{hbtp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INAHLTSVERZEICHNIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
		\thispagestyle{plain}
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AUSSEHEN DER STRUKTUREN IM INHALTSVERZEICHNIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.5em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{5em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BILDERVERZISCHNIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\listoffigures{%
    \section{\listfigurename}\label{sec:sitListOfFigures}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABELLENVERZISCHNIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\listoftables{%
    \section{\listtablename}\label{sec:sitListOfTables}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Listen für Code / Befehlseingabe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\listoflistings{%
    \section{\lstlistlistingname}\label{sec:sitListOfListings}%
    \@starttoc{lol}%
    \vskip 2em%
    }
\let\l@table\l@figure

\newcommand\listofindexinfo{%
    \section{\indexname}\label{sec:sitListOfIdxInfos}%
    \printindex%
    \printindex[idxInfo-\jobname]%
    \vskip 2em%
    }
\let\l@table\l@figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INDEXVERZEISCHNIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
%   \twocolumn[\subsection*{\indexname}]%
%   \@mkboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
%   \thispagestyle{plain}
   \parindent\z@ \parskip\z@ \@plus .3\p@\relax
   \columnseprule \z@ \columnsep 35\p@ \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
%
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LITERATURVERZEICHNIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\sitBibliography%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}

\pagenumbering{Roman}
\raggedbottom
\onecolumn
\endinput
% EOF
