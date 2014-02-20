
galeria
=======

Galeria is a small cli to help you organize photos, for those of us who keep
the photos in normal folders.

Example
-------

```bash
$ galeria organize galeria-cli/test/resources/ ~/Desktop/organized-photos
Searching for photos in galeria-cli/test/resources/
Found 25 photos in galeria-cli/test/resources/
[?] Do you want to preview the transformations? Yes
┌─────────────────────────────────────────────────────────────────────────────────────────────┐
│  from                               →  to                                                   │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│  2013/06/28/IMG_0690.JPG            →  2013/2013-06-28-16-33-23-IMG_0690.JPG                │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│  2013/08/06/P8060002.JPG            →  2013/2013-08-06-09-55-42-P8060002.JPG                │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│  Aachen/Events - 1358.jpg           →  2008/Aachen/2008-12-10-02-46-53-Events - 1358.jpg    │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│  # ... REST OF THE TABLE OMMITED FOR BREVITY ...                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│  Londres 2009/IMG_1397.JPG          →  2009/Londres 2009/2009-05-03-10-17-57-IMG_1397.JPG   │
└─────────────────────────────────────────────────────────────────────────────────────────────┘
[?] Perform the renaming? Yes
Done!

$ tree ~/Desktop/organized-photos
/Users/jkn/Desktop/organized-photos
├── 2008
│   └── Aachen
│       ├── 2008-08-20-23-37-36-Events\ -\ 1381.jpg
│       └── ...
├── 2009
│   └── Londres\ 2009
│       ├── 2009-05-03-10-06-52-IMG_1396.JPG
│       └── ...
├── 2011
│   └── Alicante
│       ├── 2011-02-02-13-40-43-Events\ -\ 2193.JPG
│       └── ...
├── 2012
│   └── India\ Maria
│       ├── 2012-02-11-15-04-02-P1030986.JPG
│       └── ...
└── 2013
    ├── 2013-06-28-16-33-23-IMG_0690.JPG
    ├── 2013-08-06-09-55-42-P8060002.JPG
    └── ...

9 directories, 25 files
```

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
  India/103_PANA/P00098098.JPG -> 2013/India/2013-10-01-6-16-24-P00098098.JPG
  Alicante/P001235234.JPG      -> 2013/Alicante/2013-12-04-12-19-30-P001235234.JPG
  ```

Usage
-----

Install galeria globally with npm.

```
npm install -g galeria
```

### Hard dependencies

`galeria` expects that `exif` from [`libexif`](http://libexif.sourceforge.net/)
is present on your system.

Install exif with your platform's native package manager:
```
apt-get install exif
yum install exif
emerge exif
brew install exif
```

### Run it!

```bash
$ galeria --help

Usage: galeria <command>

command
  organize     Organize the photos of <from> folder into <to> folder
```

