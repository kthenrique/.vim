# ----------------------------------------------------------------------------
# -- Project    : <project title> 
# ----------------------------------------------------------------------------
# -- File       : <filename> 
# -- Author     : Kelve T. Henrique
# -- Last update: <date> 
# ----------------------------------------------------------------------------
# -- Description: <What is this code for?> 
# ----------------------------------------------------------------------------

TEMPLATE  = app

# NAME OF EXEC
TARGET    = <--->

# LIBRARIES
QT       += core widgets gui                                   

# CONFIGURATION
CONFIG   += console                                  # To print to console

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

# PATH FOR HEADERS
INCLUDEPATH += ./inc

# MACROS DEFINITIONS
DEFINES  += QT_DEPRECATED_WARNINGS
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # breaks at deprecated APIs <= Qt 6.0.0
DEFINES  += QT_NO_VERSION_TAGGING

# CODE
SOURCES       += \
        <--->.cpp \

# LIBRARIES
HEADERS       += \

# UI
FORMS         += \

