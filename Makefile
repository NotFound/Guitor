# Makefile for WinxedXlib module

SRCDIR   = src/
INCLUDEDIR = include/
PIRDIR  = pir/
BUILDDIR = build/


all: $(BUILDDIR)GuitorNci.pbc $(BUILDDIR)Guitor.pbc

#---------------------------------------------------------------

# NCI

$(BUILDDIR)GuitorNci.pbc: $(PIRDIR)GuitorNci.pir
	parrot -o $(BUILDDIR)GuitorNci.pbc $(PIRDIR)GuitorNci.pir

$(PIRDIR)GuitorNci.pir: $(SRCDIR)GuitorNci.winxed
	winxed -c -o $(PIRDIR)GuitorNci.pir $(SRCDIR)GuitorNci.winxed

# Main module

$(BUILDDIR)Guitor.pbc: $(PIRDIR)Guitor.pir
	parrot -o $(BUILDDIR)Guitor.pbc $(PIRDIR)Guitor.pir

$(PIRDIR)Guitor.pir: $(SRCDIR)Guitor.winxed $(INCLUDEDIR)Guitor.winxhead
	winxed -c -o $(PIRDIR)Guitor.pir $(SRCDIR)Guitor.winxed


#---------------------------------------------------------------

clean:
	rm -f $(BUILDDIR)Guitor.pbc $(BUILDDIR)GuitorNci.pbc \
		$(PIRDIR)Guitor.pir $(PIRDIR)GuitorNci.pir

# End
