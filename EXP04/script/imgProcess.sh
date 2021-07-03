#!/usr/bin/env bash


# 压缩处理
# Param $path 图片目录\

Help(){
    echo "-q [path] Q               对jpeg格式图片进行图片质量压缩 质量因子为Q"
    echo "-r [path] R               对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率 R"
    echo "-w [path] font_size text  对图片批量添加自定义文本水印"
    echo "-p [path] text            批量重命名：统一添加文件名前缀，不影响原始文件扩展名"
    echo "-s [path] text            批量重命名：统一添加文件名后缀，不影响原始文件扩展名"
    echo "-b [path]                将png/svg图片统一转换为jpg格式图片"
    echo "-h                帮助文档"
}

JPG_compress(){
    path=$1
    Quality=$2

            #调用find找到对应的path内的jpg文件
        for file in $(find "$path" -name "*.jpg" ); do

                echo $file

                # 调用imagemagick
                $(convert "${file}" -quality "${Quality}" "${file}")
        done
}

ResolutionCompressed(){
    path=$1
    Resolution=$2


            #调用find找到对应的path内的jpg,png,svg文件
        for file in $(find "$path" -name "*.jpg" -or -name "*.png" -or -name "*.svg"); do

            echo $file

            # 调用imagemagick
            $(convert "${file}" -resize "${Resolution}" "${file}")

        done

}

AddCustomTextWatermark() {
    path=$1
    font_size=$2
    text=$3

            #调用find找到对应的path内的jpg,png,svg文件
        for file in $(find "$path" -name "*.jpg" -or -name "*.png" -or -name "*.svg"); do

            echo $file

            # 产生水印
            $(convert "${file}" -pointsize "${font_size}" -fill black -gravity center -draw "text 10,10 '${text}'" "${file}")

        done

}

function AddPrefix {
    path=$1
    new_name=$2

    for file in $(find "$path" -name "*.jpg" -or -name "*.png" -or -name "*.svg"); do
        name=${file##*/}
        mv "${file}" "${path}""${new_name}""${name}"
        
    done
}

function AddSuffix {
    path=$1
    new_suf=$2

    for file in $(find "$path" -name "*.jpg" -or -name "*.png" -or -name "*.svg"); do
        name=${file##*/}
        
        mv "${file}" "${path}""${name}"".""${new_suf}"
        
    done
}

function Become_JPG  {
    path=$1

    for file in $(find "$path" -name "*.png" -or -name "*.svg"); do
        name=${file##*/}
        prefix=${name%.*}
        mv "${file}" "${path}""${prefix}"".jpg"
        
    done
}

while [ "$1" != "" ];do
  case "$1" in
    "-q")
        JPG_compress "$2" "$3"
        exit 0
        ;;
    "-r")
        ResolutionCompressed "$2" "$3"
        exit 0
        ;;
    "-w")
        AddCustomTextWatermark "$2" "$3" "$4"
        exit 0
        ;;
    "-p")
        AddPrefix "$2" "$3"
        exit 0
        ;;
    "-s")
        AddSuffix "$2" "$3"
        exit 0
        ;;
    "-b")
        Become_JPG "$2"
        exit 0
        ;;
    "-h")
        Help
        exit 0
        ;;
  esac
done