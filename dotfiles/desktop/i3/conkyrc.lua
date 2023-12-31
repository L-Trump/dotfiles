conky.config = {
        out_to_x = false,
        out_to_console = true,
        background = false,
        double_buffer = false,
        update_interval = 1,
        total_run_times = 0,
        override_utf8_locale = false,
        short_units = true,
        if_up_strictness = 'address',
        cpu_avg_samples = 2,

};

conky.text = [[
[
#{ "full_text" : "", "color": "\#BADA55"},
#{ "full_text": " ${exec curl icanhazip.com}"},
{ "full_text" : ${if_up eno1}"  ${upspeed eno1}/s  ${downspeed eno1}/s"${else}""${endif}, "color" : "\#94F397" },
{ "full_text" : ${if_up wlo1}"  ${upspeed wlo1}/s  ${downspeed wlo1}/s"${else}""${endif}, "color" : "\#94F397" },
{ "full_text" : " ${cpu cpu0}%" , "color" : "\#8BC3E7" },
{ "full_text" : " ${mem}" , "color" : "\#B987D9" },
{ "full_text" : " ${fs_used_perc /}%" , "color" : "\#FF9D17" },
{ "full_text" : " ${battery_percent}%" , "color" : "\#A4DC6A" },
{ "full_text" : " ${time %Y/%m/%d %a}" , "color" : "\#ff797b" },
{ "full_text" : " ${time %H:%M}" , "color" : "\#8BADF9" }
],
]];
