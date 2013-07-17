#!/usr/bin/bash
  f=$1
  # change new line followed by "PhysicalObject or "Event or "Sound or "StillImage or "MovingImage to ��"PhysicalObject or ��"Event or ��"Sound or ��"StillImage or ��"MovingImage, respectively. These should be the beginnings of records.
  sed -e ':a' -e 'N' -e '$!ba' -e 's/.\n\"PhysicalObject/��\"PhysicalObject/g' $f>$f.1
  sed -e ':a' -e 'N' -e '$!ba' -e 's/.\n\"Event/��\"Event/g' $f.1>$f.2
  sed -e ':a' -e 'N' -e '$!ba' -e 's/.\n\"Sound/��\"Sound/g' $f.2>$f.3
  sed -e ':a' -e 'N' -e '$!ba' -e 's/.\n\"StilImage/��\"StillImage/g' $f.3>$f.4
  sed -e ':a' -e 'N' -e '$!ba' -e 's/.\n\"MovingImage/��\"MovingImage/g' $f.4>$f.5
  # remove all remaining \r (carriage returns), \n (line feeds), \v (vertical tabs), \f (form feeds), \t (horizontal tabs)
  tr '\r\n\v\f\t' '.....' <$f.5 > $f.6
  # change each �� to \r\n
  perl -p -e 's/��/\r\n/g' $f.6>$f
  rm $f.1
  rm $f.2
  rm $f.3
  rm $f.4
  rm $f.5
  rm $f.6