TeX-Makefile
============

このMakefileは、LaTeX をコンパイルします。部分ドキュメントや.svgファイルの
自動変換などに対応しています。

使い方
------
プロジェクトをcloneします。

```
$ git clone https://github.com/iBenza/tex-makefile
```

makeします

```
$ cd tex-makefile
$ make pdf
```

`/build/index.pdf` にファイルが出来上がります

ディレクトリ構造
----------------

### /source

`/source` に、TeX のソースファイル(.tex) を配置します。 `\include` タグで呼ばれる、
部分ドキュメントもこのディレクトリに配置します。

### /source/images

画像ファイルなどをここに配置します。画像ファイルを文章に挿入するときは、
`images/******` を指定します。

``` tex
\includegraphics[width=160pt]{images/latex.pdf}
```


.svgファイルも `/source/images` に配置することで、
自動でpdf形式の画像に変換してファイルを貼り付けることが可能です (要Inkscape)。

### /texmf

このプロジェクトのみに依存している、ローカルな `texmf` ディレクトリです。
.sty, .cls, .mapファイルを適宜配置することで、プロジェクトのビルド時にロードされます。

### /build

ビルドで生成されたファイルがここに格納されます。

License
-------
MIT
