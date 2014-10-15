class Saver
{
  ArrayList musicData;
  int buffer;
  int audioLength;
  String path;
 
  Saver (int buffer, String path)
  {
    this.buffer = buffer;
    this.path = path;
    musicData = new ArrayList();
    audioLength = 0;
   }
 
  void setElement(float data)
  {
    musicData.add (new Float (data));
  }
     
  void increaseLength ()
  {
    audioLength++;
  }
   
  String getPath()
  {
    return path;
  }
   
  int getBuffer ()
  {
    return buffer;
  }
 
  void saveData ()
  {
     
    String dataAsString = " ";
    String [] exportData = new String [audioLength];
     
    for (int i = 0; i < audioLength; i++)
    {
      dataAsString = " ";
      for (int j = 0; j < buffer; j++)
      {
        int index = i*buffer + j;
        float data = (Float) musicData.get (index);      
        dataAsString += str (data) +  " ";
      }
       
      exportData [i] = dataAsString;
    }
 
    saveStrings (path + ".txt", exportData);
    //exit();
  }
}

