
galeria
=======

Galeria is a small cli to help you organize your photos.

It is under current development, so the cli interface is not finished.

Organize photos
---------------

Using this cli you will be able to organize your photos so that sorting by name
gets you the actual order of when the photos where taken and it will give you
a consistent folder structure.

When you use galeria over a folder (of folders) of photos, it will copy it to
the destination performing the following tasks:

* Rename all the photos to their exif date + the photo name 
  `P001235234.JPG -> 2013-12-04-12-19-30-P001235234.JPG`

* Organize the photos per year 
  `103_PANA/P001235234.JPG -> 2013/2013-12-04-12-19-30-P001235234.JPG`

* Keep normal folder names inside the year folder as categories
  ```
  India/103_PANA/P00098098.JPG    -> 2013/India/2013-10-01-6-16-24-P00098098.JPG
  Alicante/P001235234.JPG -> 2013/Alicante/2013-12-04-12-19-30-P001235234.JPG
  ```

