\LoadClass[oneside]{memoir}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pmgirs}[2019/06/11 Modelo PMGIRS]

\usepackage[nonumberlist,style=index,automake]{glossaries} % parâmetro automake faz e atualiza o glossário
\usepackage{multicol}

\usepackage{enumitem}	%pacote de controle de listas -enu­mer­ate, item­ize and de­scrip­tion
\usepackage{textcomp}	%permite outros caracteres unicode como o símbolo de grau
\usepackage{scrlayer-scrpage}
\usepackage[T1]{fontenc} 
\usepackage[utf8]{inputenc}
\usepackage{geometry}
\usepackage{titlesec}
\usepackage{tikz}
\usepackage[brazil]{babel}
\usepackage{calc}
\usepackage{leading}
\usepackage{enumitem}
\usepackage[hidelinks]{hyperref}
\usepackage{xcolor}
\usepackage{longtable,ltcaption}
\RequirePackage{ifthen}
\usepackage{appendix}
\usepackage{tocloft}
\usepackage{ragged2e}
\usepackage{totalcount}
\usepackage{colortbl}
\usepackage{multirow}
\usepackage{caption}
\usepackage[version=4]{mhchem} %símbolos químicos
\usepackage[version=4]{mhchem} %símbolos químicos
\usepackage{placeins}%permite o uso do comendo \FloatBarrier, que auxilia a manter as tabelas n lugar correto - sem que o texto subsequente seja encaixado em espaços que não fariam sentido.
\usepackage{lscape} %permite uso de imagens em landscape

\DeclareCaptionFont{captiontitle}{\color{captioncolor}}
\captionsetup{labelfont={captiontitle,bf},textfont=captiontitle}

\DeclareTotalCounter{figure}
\DeclareTotalCounter{table}
\DeclareTotalCounter{quadro}

\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{headfootimage}}} 
\AtBeginDocument{\addtocontents{lof}{\protect\thispagestyle{headfootimage}}} 
\AtBeginDocument{\addtocontents{lot}{\protect\thispagestyle{headfootimage}}} 
\AtBeginDocument{\addtocontents{gls}{\protect\thispagestyle{headfootimage}}}
\AtBeginDocument{\addtocontents{ist}{\protect\thispagestyle{headfootimage}}}
\AtBeginDocument{\addtocontents{loq}{\protect\thispagestyle{headfootimage}}} 
\AtBeginDocument{\addtocontents{bbl}{\protect\thispagestyle{headfootimage}}} 


\stockaiv
\pageaiv
%\settrims{0pt}{0pt}
\setpagecc{\paperheight}{\paperwidth}{*}
% just to keep \checkandfix... happy 
\setlrmarginsandblock{3cm}{3cm}{*}
\setulmarginsandblock{2cm}{3cm}{*}
\checkandfixthelayout

\setlength{\evensidemargin}{\oddsidemargin}

\renewcommand*{\glsclearpage}{}

\newcommand{\trecholei}[1]{\begin{adjustwidth}{0.5\textwidth}{0cm} #1 \end{adjustwidth}}

\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\errataname}{Errata}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\anexoname}{ANEXO}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{AP\^ENDICE}
\newcommand{\apendicesname}{Ap\^endices}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{Folha de aprova\c{c}\~ao}
\newcommand{\resumoname}{Resumo} 
\newcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
\newcommand{\listadesimbolosname}{Lista de s\'imbolos}
\newcommand{\fontename}{Fonte}
\newcommand{\notaname}{Nota}
\newcommand{\nomeProduto}{Produto X - Nome Produto}
\newcommand{\nomeMunicipio}{Nome do Municipio}
\newcommand{\mes}{Mês}
\newcommand{\ano}{Ano}

\addto\captionsbrazil{
	%% ajusta nomes padroes do babel
	\renewcommand{\bibname}{\Large\bfseries REFER\^ENCIAS}
	\renewcommand{\indexname}{\'Indice}
	\renewcommand{\listfigurename}{Lista de ilustra\c{c}\~{o}es}
	\renewcommand{\listtablename}{Lista de tabelas}
	%% ajusta nomes usados com a macro \autoref
	\renewcommand{\pageautorefname}{p\'agina}
	\renewcommand{\sectionautorefname}{se{\c c}\~ao}
	\renewcommand{\subsectionautorefname}{subse{\c c}\~ao}
	\renewcommand{\paragraphautorefname}{par\'agrafo}
	\renewcommand{\subsubsectionautorefname}{subse{\c c}\~ao}
	\renewcommand{\paragraphautorefname}{subse{\c c}\~ao}
}

\renewcommand{\printtoctitle}{\centering\Large\bfseries\MakeUppercase}
\renewcommand{\printloftitle}{\centering\Large\bfseries\MakeUppercase}
\renewcommand{\printlottitle}{\centering\Large\bfseries\MakeUppercase}

\setlist{leftmargin=2cm}

\newcommand*{\BeginNoToc}{%
	\addtocontents{toc}{%
		\edef\protect\SavedTocDepth{\protect\the\protect\value{tocdepth}}%
	}%
	\addtocontents{toc}{%
		\protect\setcounter{tocdepth}{-10}%
	}%
}
\newcommand*{\EndNoToc}{%
	\addtocontents{toc}{%
		\protect\setcounter{tocdepth}{\protect\SavedTocDepth}%
	}%
}

% ---
%Definição do layout da pagina
% ---
\geometry{
	a4paper,
	total={150mm,250mm},
	left=30mm,
	top=25mm,
	bottom=55mm,
	right=30mm
}
% ---
%Modificação da fonte
% ---
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial

% ---
%Header e Footer -- Estilo de pagina
% ---


\newcommand\headimageheight{1cm}
\newcommand\footimageheight{2cm}
\newcommand\seplineheight{.2cm}

\newsavebox{\headimage}
\sbox\headimage{%
	\tikz{
		\clip(0,0)rectangle(\paperwidth,-\headimageheight);
		\node[inner sep=0pt,outer sep=0pt,anchor=north west]{%
			\includegraphics[width=\paperwidth]{src/layout/header}};
	}%
}

\newsavebox{\footimage}
\sbox\footimage{%
	\tikz{
		\clip(-2.8,0.3)rectangle(\paperwidth,-\footimageheight);
		\node[inner sep=0cm,outer sep=-0.3cm,anchor=north west]{%
			\includegraphics[width=16cm,height=1.75cm]{src/layout/bottom}};
	}%
}

\DeclareNewLayer[
background,
area={0pt}{0pt}{\paperwidth}{\headimageheight},
contents={%
	\parbox[c][\layerheight]{\layerwidth}{%
		\vspace*{\stretch{2}}
		\vspace*{\stretch{1}}}%
	%}%
}
]{headtext}

\DeclareNewLayer[
clone=headtext,
addheight=\seplineheight,
contents={\usebox\headimage}
]{headimage}

\DeclareNewLayer[
background,
align=b,
area={0pt}{\paperheight}{\paperwidth}{\footimageheight}
]{foottext}

\DeclareNewLayer[
clone=foottext,
addheight=\seplineheight,
contents={\parbox{\layerwidth}{\usebox\footimage}}
]{footimage}

\DeclareNewLayer[
background,
align=b,
area={17.70cm}{28.73cm}{\paperwidth}{\footimageheight},
contents={{\Large\textbf{\pagemark}}}
]{footpage}

\DeclarePageStyleByLayers{headfootimage}{%
	headimage,
	footimage,
	footpage
}
\DeclarePageStyleByLayers{headimage}{%
	headimage
}

\setkomafont{pagenumber}{\color{white}}
% ---
%Fim de estilo de página
% ---
% ---
%definição do estilo para todas as páginas.
% ---
\pagestyle{empty}

% -----
% Configuracoes do TOC
% -----
% nivel de profundidade (implementa o quinto nivel - subsubsubsection)
\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}


% redefine os comandos *paragraph* para *subsubsubsection* ****
\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont\sffamily\raggedright}%

% lista de ilustracoes
\renewcommand{\cftfigurename}{\figurename\space} 
\renewcommand*{\cftfigureaftersnum}{\hfill\textendash\hfill}
 
% lista de tabelas  
\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill\textendash\hfill}	

% ---
% Espacamento entre linhas - NBR 14724/2011 - 5.2 Espacamento
% ---
\setlength{\parindent}{0cm}
\setlength{\parskip}{24pt}
\renewcommand{\baselinestretch}{1.5}
% ---
% ---

% ---
% Seções
% ---
\counterwithout{section}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}



%\titlespacing{\chapter}
%{0pt}
%{0pt plus 4pt minus 12pt}
%{1.5em plus 2pt minus 2pt}
\makeatletter
\renewcommand{\section}{\@startsection{section}
	{1}
	{-0.75cm}
	{1.5em}
	{24pt}
	{\Large\bfseries\raggedright\color{title1}}}

\renewcommand{\subsection}{\@startsection{subsection}
	{2}
	{0cm}
	{1.5em}
	{1em}
	{\Large\bfseries\raggedright\color{title2}}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}
	{3}
	{1cm}
	{1.5em}
	{1em}
	{\Large\bfseries\raggedright\color{title3}}}
\makeatother

\let\svsection\section
\let\svsubsection\subsection
\let\svsubsubsection\subsubsection
\def\section{\leftskip 0ex\svsection}
\def\subsection{\leftskip 1cm\svsubsection}
\def\subsubsection{\leftskip 2.22cm\svsubsubsection}

\titleformat{\section}         % Customise the \section command 
{\Large\bfseries\scshape\raggedright\color{title1}} % Make the \section headers large (\Large),
% small capitals (\scshape) and left aligned (\raggedright)
{\thesection}{1em}                      % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading



%\titlespacing % starred version: first paragraph is not indented
%{\section} % <command>
%{-0.75cm} % <left>
%{0pt} % <before-sep>
%{0em} % <after-sep>
%
%\titlespacing* % starred version: first paragraph is not indented
%{\section} % <command>
%{-0.75cm} % <left>
%{0pt} % <before-sep>
%{0em} % <after-sep>

\setsecnumdepth{subsubsection}

\titleformat{\subsection}
[hang]
{\Large\bfseries\scshape\raggedright\color{title2}}
{\llap{\thesubsection}}{1em}
{}

%\titlespacing{\subsection}
%{0pt}
%{12pt plus 4pt minus 12pt}
%{1.5em plus 2pt minus 2pt}

\titleformat{\subsubsection}
[hang]
{\Large\bfseries\scshape\raggedright\color{title3}}
{\thesubsubsection}{1em}
{}

%\titlespacing{\subsection}
%{0pt}
%{12pt plus 4pt minus 12pt}
%{1.5em plus 2pt minus 2pt}

\aliaspagestyle{chapter}{headfootimage}

% Novo list of (listings) para QUADROS

\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{\hfill\bfseries\Large LISTA DE QUADROS\hfill}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry[chapter]{quadro}{loq}{0}

% configurações para atender às regras da ABNT
\setfloatadjustment{quadro}{\centering}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}


% Configuração de posicionamento padrão:
\setfloatlocations{quadro}{hbtp}

\newcommand{\tocpartapendices}{}
\newcommand{\tocpartanexos}{}
\cftinsertcode{A}{\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}}
\renewcommand{\tocpartapendices}{%
	\addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
	\cftinserthook{toc}{A}}
\renewcommand{\tocpartanexos}{%
	\addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
	\cftinserthook{toc}{A}}
%

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao APENDICES e ANEXOS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Definicoes compartilhadas entre Apendices e Anexos
% ---
\provideboolean{abntex@apendiceousecao}
\setboolean{abntex@apendiceousecao}{false}
\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
	\setboolean{abntex@apendiceousecao}{true}%
	\renewcommand{\appendixname}{#1}
	\renewcommand{\appendixtocname}{\uppercase{#2}}
	\renewcommand{\appendixpagename}{#2}
	\switchchapname{#1}% Corrected from \switchapname -> \switchchapname
	\renewcommand*{\cftappendixname}{#1 \space}
}
% ---

% ---
% Apendices - comando 
\newcommand{\apendices}{%
	\PRIVATEapendiceconfig{\apendicename}{\apendicesname}
	\appendix
}
% Apendices - ambiente
\newenvironment{apendicesenv}{%
	\PRIVATEapendiceconfig{\apendicename}{\apendicesname}
	\begin{appendix}
		%\thispagestyle{headfootimage}
	}{
	\end{appendix}
	\setboolean{abntex@apendiceousecao}{false}
	\bookmarksetup{startatroot}
}
% ---

% ---
% Anexos - comando
\newcommand{\anexos}{%
	\cftinserthook{toc}{AAA}
	
	\PRIVATEapendiceconfig{\anexoname}{\anexosname}
	\appendix
	\renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}
% Anexos - ambiente
\newenvironment{anexosenv}{%
	\cftinserthook{toc}{AAA}
	
	\PRIVATEapendiceconfig{\anexoname}{\anexosname}
	\begin{appendix}
		\renewcommand\theHchapter{anexochapback.\arabic{chapter}}
	}{
	\end{appendix}
	\setboolean{abntex@apendiceousecao}{false}
	\bookmarksetup{startatroot}
}
% ---

% ---
% Imprime uma pagina de divisao no estilo parte
\newcommand{\partpage}{%
	\phantomsection
	\addcontentsline{toc}{part}{\appendixtocname}%
	\appendixpage*
}

% atalhos para \partpage ou \appendixpage* 
\makeatletter
\newcommand{\partapendices}{%
	\tocpartapendices%
	\@ifstar{\appendixpage*}{\partpage}}

\newcommand{\partanexos}{%
	\tocpartanexos%
	\@ifstar{\appendixpage*}{\partpage}}
\makeatother
% ---

%COR DOS TITULOS

\definecolor{title1}{RGB}{151,72,7}
\definecolor{title2}{RGB}{227,108,10}
\definecolor{title3}{RGB}{89,89,89}
\definecolor{capaprodmun}{RGB}{31,73,125}
\definecolor{captioncolor}{RGB}{227,108,10}

