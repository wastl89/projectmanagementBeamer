# hda.git

## Dokumentation zu LaTeX-Vorlagen

Die Anleitung `UG_hda-latex` beschreibt die Nutzung der hda-Vorlagen 
zur Darstellung von Dokumenten im Concept- oder Guide-Format.

Zum Test wird ein neues Feature entsprechend in die Dokumentation 
aufgenommen und die Anleitung nach einer Änderung im entsprechenden 
Design aufbereitet:
- hdaGuide: `UG_hda-latex_Guide.pdf`
- hdaConcept: `UG_hda-latex_Concept.pdf`

Damit das Vorlagenverzeichnis klein bleibt und um eine unabhängige Testumgebung für die Vorlagen zu erhalten, wurde die Dokumentation in das unabhängige Projekt ausgelagert. 

Die Dokumentation der hda-Vorlagen wird im Repository `hda-latex.git` mit `hda.git` als Submodule im Verzeichnis `/hda` verwaltet. 

## Templates in `/std`

Ein Muster der Steuerdateien für eigene Dokumente im Format 
-guide oder -concept findet sich im Verzeichnis `/std`.

Zusätzlich stehen Mustertexte zur Integration in alle Dokumente zur Verfügung, welche die Elemente nutzen: 
- zur allgemeine Darstellungen (sec Typo) 
- zur Hervorhebung von Informationen und 
  zur Erstellung eines Index (sec Informationen) 
	- zur Aufbereitung von Aktivitäten, optional (subsec ToDo) 

## Vorlagenelemente in `/sty`

Die Style- (`.sty`) und Class-Dateien (`.cls`) der Vorlagen greifen auf einheitliche standardisierte Elemente zurück, die im Verzeichnis `/sty` verwaltet werden. 

## Einheitliche Bezeichnungen und Logo's

Damit in Projekten mit Sponsoren einheitliche Bezeichnungen der Firmen, Produkte und Logo's genutzt werden, wurden die bisherigen Definitionen in der Verzeichnisstruktur `/pp` bereitgestellt. 

Dies ist auch als Vorgehen für eine Vereinheitlichung in einem Projekt sinnvoll, um einen Arbeitstitel am Ende einheitlich und effizient umbenennen zu können und dies auch effizient auf die bisherigen Texte übernehmen / anwenden zu können. 

	/hda	Hochschule Darmstadt, fbi, fbe
	/ibmi	IBM i, Rational  
	/mt 	Managetopia, Aschaffenburg
	/pb 	Projektron, Berlin
	/ps 	Power Students
	/sit	Sielhorst iT Beratung, Darmstadt
	/tt 	Tradui Technologies, Frankfurt

## Individuelle Vorlagen 

Zusätzlich können dadurch die Vorlagen leicht(er) auf eine Darstellung 
für einen Sponsor umgestellt werden, in dem die Vorlagen und 
optional kann für Testzwecke auch die Dokumentation dafür unabhängig 
definiert werden, etwa um einige Farben und das Logo zu wechseln: 

	/mt 	managetopia, Aschaffenburg

	mt.git      	Vorlagen für managetopia
	mt-latex.git	Dokumentation zu mt-Vorlagen 

Dann kann über eine fast identischen Steuerdatei, 
`mt-latex-guide-steuerdatei.tex` die Aufbereitung der Texte 
in einer mt-Darstellungen erfolgen. Dafür werden in der Steuerdatei nur die Verzeichnisse und Bezeichnungen `hda/hda...` geändert.

Durch die Struktur bleiben alle anderen Referenzen gültig. 

# Vererbung 

Da die Ursprüngliche Vorlage von Sielhorst iT Beratung (`sit.git`) abgeleitet wurde, wurden die LaTeX-Befehle in den Vorlagen alle mit `\sit` als Präfix definiert und entsprechend in alle abeleiteten Vorlagen übertragen.

Für Fragen kontaktieren Sie den Autor - vorzugsweise über das Ticketsystem oder per E-Mail: 

In der Hochschule: 
<a href="https://bcs.power-students.de">bcs.power-students.de</a>, 
<a href="mailto:manfred.sielhorst@h-da.de">manfred.sielhorst@h-da.de</a>.


Im Unternehmen: 
<a href="https://bcs.sielhorst-it.de">bcs.sielhorst-it.de</a>, 
<a href="mailto:manfred@sielhorst-it.de">manfred@sielhorst-it.de</a>.


Aus Sicherheitsgründen ist für E-Mail Absender eine Hochschuladresse (von Studierenden mit `@stud.h-da.de`) und eine qualifizierte Signatur notwendig. 

<div class="footer">
    &copy; 2020, Sielhorst iT Beratung UG 
</div>