import modeler.api
import os

for stream in modeler.script.streams():
    print("stream:"+stream.getName().encode('utf-8'))
    #streamfilenpath=stream.getLastSavedAs()
    #newpath=os.path.dirname(streamfilenpath)

    #session=modeler.script.session()
    #newpath=session.getDefaultDataDirectory()
    #print("newpath:"+newpath.encode('utf-8'))

    for node in stream.iterator():
        if (node.getTypeName() == "variablefile"
            or node.getTypeName() == "excelimport"
            or node.getTypeName() == "statisticsimport"
            or node.getTypeName() == "outputfile"
            or node.getTypeName() == "excelexport"
            or node.getTypeName() == "statisticsexport"):
            full_filename=node.getPropertyValue("full_filename")
            print("old:"+full_filename.encode('utf-8'))
            #full_filename=newpath+"\\"+os.path.basename(full_filename)
            full_filename=os.path.basename(full_filename)
            print("new:"+full_filename.encode('utf-8'))
            node.setPropertyValue("full_filename",full_filename)