#!/usr/bin/env bash

function Help {
        echo "-a [data_file]                       统计访问来源主机TOP 100和分别对应出现的总次数"
        echo "-b [data_file]                       统计访问来源主机TOP 100 IP和分别对应出现的总次数"
        echo "-c [data_file]                       统计最频繁被访问的URL TOP 100"
        echo "-d [data_file]                       统计不同响应状态码的出现次数和对应百分比"
        echo "-e [data_file]                       分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数"
        echo "-f [data_file][aimed_url]            给定URL输出TOP 100访问来源主机"
        echo "-h                                   帮助文档"
}


function host_top100 {
        path=$1
        awk 'BEGIN {printf "统计访问来源主机TOP-100和对应出现的总次数:\n" }
        {print $1 }' "$path" | sort | uniq -c | sort -nr | head -n 100
}


function host_ip_top100 {
        path=$1

        awk 'BEGIN {printf "访问来源主机TOP-100IP和分别对应出现的总次数:\n" }
        {if($1~/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/)
        {print $1}
        }' "$path" | sort | uniq -c | sort -nr | head -n 100
}


function url_top100 {
    path=$1
        awk 'BEGIN {printf "最频繁被访问的URL TOP-100:\n" }
        {print $5}' "$path" | sort | uniq -c | sort -nr | head -n 100
}


function response_calc {
    path=$1
        awk 'BEGIN{sum=-1;printf "不同响应状态码的出现次数和对应百分比:\n"}
        {if($6!="response")
        {a[$6]++};sum++}
        END{for(i in a)
        {printf "%s: %dtimes(%.4f%%)\n",i,a[i],a[i]*100/sum}
        }' "$path"
}


function response_4xx_calc {
    path=$1
        awk 'BEGIN{printf "403状态码对应的TOP 10 URL和对应出现的总次数:\n"}
        {if($6=="403")
        {print $5}
        }' "$path" | sort | uniq -c | sort -nr | head -n 10

        awk 'BEGIN{printf "404状态码对应的TOP 10 URL和对应出现的总次数:\n"}
        {if($6=="404")
        {print $5}
        }' "$path" | sort | uniq -c | sort -nr | head -n 10
}


function aimed_host_top100 {
        path=$1
        url=$2
        awk 'BEGIN{printf "%s的TOP 100访问来源主机:\n","'"$url"'"}
        {if($5=="'"$url"'")
        {print $1}
        }' "$path" | sort | uniq -c | sort -nr | head -n 100
}


while [ "$1" != "" ];do
    case "$1" in
        "-a")
            host_top100 "$2"
            exit 0
            ;;
        "-b")
            host_ip_top100 "$2"
            exit 0
            ;;
        "-c")
            url_top100 "$2"
            exit 0
            ;;
        "-d")
            response_calc "$2"
            exit 0
            ;;
        "-e")
            response_4xx_calc "$2"
            exit 0
            ;;
        "-f")
            aimed_host_top100 "$2" "$3"
            exit 0
            ;;    
        "-h")
            Help
            exit 0
            ;;
    esac
done

