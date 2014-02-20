
galeria
=======

Galeria is a small cli to help you organize photos, for those of us who keep
the photos in normal folders.

[Usage][]

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


Organize photos
---------------

Using this cli you will be able to organize your photos with consistent folder
structure and naming convention.

When you use galeria over a folder (of folders) of photos, it will copy them to
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

#### Example:

So from this folder of photos:
```
├── 2013
│   ├── 06
│   │   └── 28
│   │       └── IMG_0690.JPG
│   └── 08
│       └── 06
│           ├── P8060001.JPG
│           └── P8060002.JPG
├── Aachen
│   ├── Events\ -\ 1357.jpg
│   ├── Events\ -\ 1358.jpg
│   ├── Events\ -\ 1381.jpg
│   ├── Events\ -\ 1382.jpg
│   └── Events\ -\ 1383.jpg
├── Alicante
│   ├── Events\ -\ 2193.JPG
│   ├── Events\ -\ 2194.JPG
│   ├── Events\ -\ 2195.JPG
│   ├── Events\ -\ 2196.JPG
│   └── Events\ -\ 2197.JPG
├── India\ Maria
│   ├── 103_PANA
│   │   ├── P1030985.JPG
│   │   ├── P1030986.JPG
│   │   ├── P1030987.JPG
│   │   └── P1030988.JPG
│   └── 104_PANA
│       ├── P1040375.JPG
│       ├── P1040376.JPG
│       ├── P1040377.JPG
│       └── P1040378.JPG
└── Londres\ 2009
    ├── IMG_1396.JPG
    ├── IMG_1397.JPG
    ├── IMG_1398.JPG
    └── IMG_1400.JPG
```
After running galeria we would get in the destination folder:
```
├── 2008
│   └── Aachen
│       ├── 2008-08-20-23-37-36-Events\ -\ 1381.jpg
│       ├── 2008-08-20-23-37-46-Events\ -\ 1382.jpg
│       ├── 2008-08-20-23-37-52-Events\ -\ 1383.jpg
│       ├── 2008-12-10-02-46-53-Events\ -\ 1358.jpg
│       └── 2008-12-15-00-04-53-Events\ -\ 1357.jpg
├── 2009
│   └── Londres\ 2009
│       ├── 2009-05-03-10-06-52-IMG_1396.JPG
│       ├── 2009-05-03-10-17-57-IMG_1397.JPG
│       ├── 2009-05-03-10-18-08-IMG_1398.JPG
│       └── 2009-05-03-10-25-02-IMG_1400.JPG
├── 2011
│   └── Alicante
│       ├── 2011-02-02-13-40-43-Events\ -\ 2193.JPG
│       ├── 2011-02-02-13-51-27-Events\ -\ 2194.JPG
│       ├── 2011-02-02-13-56-42-Events\ -\ 2195.JPG
│       ├── 2011-02-02-13-57-00-Events\ -\ 2196.JPG
│       └── 2011-02-02-13-57-26-Events\ -\ 2197.JPG
├── 2012
│   └── India\ Maria
│       ├── 2012-02-11-15-04-02-P1030986.JPG
│       ├── 2012-02-12-06-23-12-P1030987.JPG
│       ├── 2012-02-12-06-49-22-P1030988.JPG
│       ├── 2012-02-26-12-05-36-P1040375.JPG
│       ├── 2012-02-26-12-05-52-P1040376.JPG
│       ├── 2012-02-26-12-06-02-P1040377.JPG
│       ├── 2012-04-30-18-23-08-P1030985.JPG
│       └── 2012-04-30-18-45-01-P1040378.JPG
└── 2013
    ├── 2013-06-28-16-33-23-IMG_0690.JPG
    ├── 2013-08-06-09-55-25-P8060001.JPG
    └── 2013-08-06-09-55-42-P8060002.JPG
```

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

