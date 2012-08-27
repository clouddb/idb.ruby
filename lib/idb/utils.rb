require 'uri'
require 'fileutils'
require 'ffi-xattr'

module iDB
  def GetXattrKeys(aFile)
    result = nil
    x = Xattr.new(aFile)
    result=x.list()
    return result
  end

  def GetXattrValue(aFile, aKey):
      result = nil
      x = Xattr.new(aFile)
      result = x[aKey]
      return result
  end

  def SetXattrValue(aFile, aKey, aValue):
      result = nil
      x = xattr(aFile)
      x[aKey] = aValue
      result  = true
      return result
  end
  def IsXattrValueExists(aFile, aKey):
      result = False
      x = xattr(aFile)
      result = x.has_key(aKey)
      return result
  end

  # return the dir's count in aDir
  def GetDirCount(aDir):
      return Dir[File.join(aDir, '*')].count {|file| File.directory?(file)}
  end

  # return the file's count in aDir
  def GetFileCount(aDir):
      return Dir[File.join(aDir, '*')].count {|file| File.file?(file)}
  end

  # Create all missed directoy 
  def CreateDir(aDir):
          FileUtils.mkdir_p(aDir)
  end
  def TouchFile(aFileName, aTimeStamp = None):
    FileUtils.touch(aFileName)
  end

  # the Conversion functions:
  def Str2Int(value):
      if value != nil
          base = 10
          if len(value) >= 2:
              if value[0] == '"' and value[-1] == '"':
                  value = value[1:-1]
              elsif value[0] == "'" and value[-1] == "'":
                  value = value[1:-1]
              end
          end
          vSign = ''
          if value[0] == '+' or value[0] == '-':
              vSign = value[0]
              value = value[1:]
          end
          if value[0] == '$':
              value = value[1:]
              base = 16
          elsif value[0:2] == '0x':
              value = value[2:]
              base = 16
          end
          if vSign:
              value  = vSign + value
          end
          result = value.to_i(base)
      else
          result = nil
      end

      return result
  end

  def Str2Hex(value):
      if value[0]  == '$':
          value = value[1:]
      end
      return int(value, 16)

  def Hex2Str(value):
      return '$' + hex(value)[2:]
  end

  def Str2Bool(value):
      """
      Converts 'something' to boolean. Raises exception if it gets a string it doesn't handle.
      Case is ignored for strings. These string values are handled:
        True: 'True', "TRue", "yes", "y", "t"
        False: "", "faLse", "no", "n", "f"
      #Non-string values are passed to bool.
      """
      #if type(value) == type(''):
      if value.lower() in ("yes", "y", "true",  "t"):
          return True
      end
      if value.lower() in ("no",  "n", "false", "f"):
          return False
      end
      raise ValueError('Invalid value for boolean conversion: ' + value)
      #return bool(value)
  end
end
