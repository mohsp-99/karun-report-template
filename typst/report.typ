// =============================================================================
// report.typ — EDIT THIS: your report content (the Typst port of main-article.tex).
//
// 1. Fill in metadata.typ.
// 2. Write your content below using plain Typst markup (see the cheatsheet).
// 3. Build (output goes into build/). --font-path fonts uses the bundled Dubai
//    font, so no system install is needed:
//      typst compile --font-path fonts report.typ "build/My Report.pdf"
//
// Set lang to "en" (left-to-right) or "fa" (Persian, right-to-left).
// =============================================================================

#import "karun.typ": *
#import "metadata.typ": meta

#show: karun-report.with(lang: "fa", meta: meta)

// --- Title page + table of contents (leave these as-is) ---------------------
#title-page(meta, lang: "fa")
#contents-page(lang: "fa")

// ===========================================================================
// YOUR CONTENT STARTS HERE
// ===========================================================================

// A Latin technical token inside RTL text. Without an LTR isolate the bidi
// algorithm reorders it — «01-SE40001-3» comes out as «SE40001-3-01».
#let lt(body) = box(text(dir: ltr, body))

#align(center)[بسمه تعالی]

= معرفی قطعات

#long-table[
  #figure(
    table(
      columns: (0.63fr, 2.52fr, 1.42fr, 2.38fr, 3.05fr),
      align: center + horizon,
      table.header(repeat: true,
        [ردیف], [نام قطعه], [تعداد], [پارت نامبر], [تصویر]),
      [#lt[1]],
      [پنل جانبی \
        #lt[Side panel]],
      [#lt[2]],
      [#lt[01-SE40001-3]],
      [#image("images/subrack-utility/u02-1.png", width: 94%)],
      [#lt[2]],
      [ریل افقی لبه دار \
        #lt[Horizontal rail with lip]],
      [#lt[1]],
      [#lt[01-S0000RE]],
      [#image("images/subrack-utility/u02-2.png", width: 94%)],
      [#lt[3]],
      [ریل افقی بک پلین \
        #lt[Horizontal rail for] \
        #lt[backplain]],
      [#lt[2]],
      [#lt[01-S0000RB]],
      [#image("images/subrack-utility/u02-3.png", width: 94%)],
      [#lt[4]],
      [ریل افقی بدون لبه \
        #lt[Horizontal rail without lip]],
      [#lt[3]],
      [#lt[01-S0000RN]],
      [#image("images/subrack-utility/u02-4.png", width: 94%)],
      [#lt[5]],
      [براکت جلویی \
        #lt[Bracket]],
      [#lt[2]],
      [#lt[01-SE4002]],
      [#image("images/subrack-utility/u03-1.png", width: 94%)],
      [#lt[6]],
      [براکت پشتی \
        #lt[Rear angle]],
      [#lt[2]],
      [#lt[01-SE4003]],
      [#image("images/subrack-utility/u03-2.png", width: 94%)],
      [#lt[7]],
      [دسته جلویی \
        #lt[Hangle]],
      [#lt[2]],
      [#lt[01-SE4004]],
      [#image("images/subrack-utility/u03-3.png", width: 94%)],
      [#lt[8]],
      [نوار رزوه \
        #lt[Threaded insert]],
      [#lt[6]],
      [#lt[01-S0000TI]],
      [#image("images/subrack-utility/u03-4.png", width: 94%)],
      [#lt[9]],
      [نوار سوراخدار \
        #lt[Perforated strip]],
      [#lt[4]],
      [#lt[01-S0000PS]],
      [#image("images/subrack-utility/u04-1.png", width: 94%)],
      [#lt[10]],
      [گسکت افقی \
        #lt[Horizontal EMC gasket]],
      [#lt[4]],
      [#lt[01-S0000GH]],
      [#image("images/subrack-utility/u04-2.png", width: 94%)],
      [#lt[11]],
      [گسکت کاور \
        #lt[Cover EMC gasket]],
      [#lt[4]],
      [#lt[01-S0000GC]],
      [#image("images/subrack-utility/u04-3.png", width: 94%)],
      [#lt[12]],
      [گسکت عمودی \
        #lt[Vertical EMC gasket]],
      [#lt[13]],
      [#lt[01-S0000GV]],
      [#image("images/subrack-utility/u04-4.png", width: 94%)],
      [#lt[13]],
      [ریل راهنما \
        #lt[Guide rail]],
      [#lt[10/10]],
      [#lt[01-AG220-0] \
        & \
        #lt[01-AG220-1]],
      [#image("images/subrack-utility/u05-1.png", width: 94%)],
      [#lt[14]],
      [پنل پشتی \
        #lt[Rear panel]],
      [#lt[1]],
      [#lt[108-01-AF430-G-V1]],
      [#image("images/subrack-utility/u05-2.png", width: 94%)],
      [#lt[15]],
      [کاور \
        #lt[Cover]],
      [#lt[2]],
      [#lt[01-S0000C0-3]],
      [#image("images/subrack-utility/u05-3.png", width: 94%)],
      [#lt[16]],
      [محافظ فن \
        #lt[Fan shield]],
      [#lt[3]],
      [\-],
      [#image("images/subrack-utility/u05-4.jpg", width: 94%)],
      [#lt[17]],
      [فن دی سی #lt[60]\*#lt[60] \
        #lt[60x60 DC fan]],
      [#lt[3]],
      [#lt[AFB0605MC]],
      [#image("images/subrack-utility/u06-1.png", width: 94%)],
      [#lt[18]],
      [نوار ایزوله بک پلین \
        #lt[Isolation strip]],
      [#lt[2]],
      [#lt[01-S0000IS]],
      [#image("images/subrack-utility/u06-2.png", width: 94%)],
      [#lt[19]],
      [کانکتور تغذیه #lt[C14] فیوزدار \
        #lt[C14 fused connector]],
      [#lt[2]],
      [#lt[KM01.1205.11]],
      [#image("images/subrack-utility/u06-3.png", width: 94%)],
      [#lt[20]],
      [کیت پنل #lt[Clock] \
        #lt[Clock panel kit]],
      [#lt[1]],
      [#lt[108-01-AC420-4-V1]],
      [#image("images/subrack-utility/u06-4.png", width: 94%)],
      [#lt[21]],
      [کیت پنل #lt[ADSB] \
        #lt[ADSB panel kit]],
      [#lt[1]],
      [#lt[108-01-AC420-4-V6]],
      [#image("images/subrack-utility/u07-1.png", width: 94%)],
      [#lt[22]],
      [کیت پنل #lt[GPS] \
        #lt[GPS panel kit]],
      [#lt[1]],
      [#lt[108-01-AC420-4-V2]],
      [#image("images/subrack-utility/u07-2.png", width: 94%)],
      [#lt[23]],
      [کیت پنل #lt[RF] \
        #lt[RF panel kit]],
      [#lt[1]],
      [#lt[108-01-AC420-4-V4]],
      [#image("images/subrack-utility/u07-3.png", width: 94%)],
      [#lt[24]],
      [کیت پنل #lt[Sensor] \
        #lt[Sensor panel kit]],
      [#lt[1]],
      [#lt[108-01-AC420-4-V3]],
      [#image("images/subrack-utility/u08-1.png", width: 94%)],
      [#lt[25]],
      [کیت پنل #lt[Splitter] \
        #lt[Splitter panel kit]],
      [#lt[1]],
      [#lt[108-01-AC420-4-V5]],
      [#image("images/subrack-utility/u08-2.png", width: 94%)],
      [#lt[26]],
      [کیت پنل تغذیه #lt[5V] \
        #lt[5VPower supply panel kit]],
      [#lt[1]],
      [#lt[108-01-AC430-4-V1]],
      [#image("images/subrack-utility/u08-3.png", width: 94%)],
      [#lt[27]],
      [کیت پنل تغذیه #lt[12V] \
        #lt[12VPower supply panel] \
        #lt[kit]],
      [#lt[1]],
      [#lt[108-01-AC430-4-V2]],
      [#image("images/subrack-utility/u09-1.png", width: 94%)],
      [#lt[28]],
      [پنل کورکن #lt[10HP] \
        #lt[10HP filler panel]],
      [#lt[2]],
      [#lt[01-AF430-8]],
      [#image("images/subrack-utility/u09-2.png", width: 94%)],
      [#lt[29]],
      [#lt[Cross recess collar screw] \
        #lt[M2.5x12]],
      [#lt[46]],
      [\-],
      [#image("images/subrack-utility/u09-3.jpg", width: 94%)],
      [#lt[30]],
      [#lt[Cross recess] \
        #lt[countersunk screw] \
        #lt[M2.5x8]],
      [#lt[8]],
      [\-],
      [#image("images/subrack-utility/u09-4.jpg", width: 94%)],
      [#lt[31]],
      [#lt[Grub screw M2.5x9]],
      [#lt[12]],
      [\-],
      [#image("images/subrack-utility/u10-1.jpg", width: 94%)],
      [#lt[32]],
      [#lt[Cross recess screw] \
        #lt[M2.5x10]],
      [#lt[12]],
      [\-],
      [#image("images/subrack-utility/u10-2.jpg", width: 94%)],
      [#lt[33]],
      [#lt[Cross recess screw] \
        #lt[M4x30]],
      [#lt[12]],
      [\-],
      [#image("images/subrack-utility/u10-3.jpg", width: 94%)],
      [#lt[34]],
      [#lt[M4 nut]],
      [#lt[12]],
      [\-],
      [#image("images/subrack-utility/u10-4.png", width: 94%)],
      [#lt[35]],
      [#lt[M4 spring washer]],
      [#lt[12]],
      [\-],
      [#image("images/subrack-utility/u10-5.png", width: 94%)],
      [#lt[36]],
      [#lt[M4 flat washer]],
      [#lt[12]],
      [\-],
      [#image("images/subrack-utility/u11-1.png", width: 94%)],
      [#lt[37]],
      [#lt[Sleeve]],
      [#lt[40]],
      [\-],
      [#image("images/subrack-utility/u11-2.png", width: 94%)],
      [#lt[38]],
      [#lt[Countersunk torx M5x12]],
      [#lt[4]],
      [\-],
      [#image("images/subrack-utility/u11-3.jpg", width: 94%)],
      [#lt[39]],
      [#lt[Torx M4x6]],
      [#lt[56]],
      [\-],
      [#image("images/subrack-utility/u11-4.jpg", width: 94%)],
      [#lt[40]],
      [#lt[Torx m4x12 self-lock]],
      [#lt[24]],
      [\-],
      [#image("images/subrack-utility/u11-5.jpg", width: 94%)],
    ),
    caption: [معرفی قطعات سابرک یوتیلیتی.],
  )
]

= دستورالعمل مونتاژ

#long-table[
  #figure(
    table(
      columns: (1.26fr, 3.70fr, 5.04fr),
      align: center + horizon,
      table.header(repeat: true, [مرحله], [توضیحات], [تصویر]),
      [#lt[1]],
      [فن و محافظ فن را بر روی پنل پشتی نصب کنید.

        شماره قطعه: #lt[14-16-17-35-36-37-38]],
      [#image("images/subrack-utility/u12-1.jpg", width: 96%)],
      [#lt[2]],
      [نوار رزوه دار و نوار سوراخدار را در محل آن برروی ریل ها قرار دهید. برای ریل بک پلین تنها از نوار سوراخدار استفاده شود.

        شماره قطعه: #lt[2-8-9]],
      [#image("images/subrack-utility/u12-2.png", width: 96%)],
      [#lt[3]],
      [با استفاده از پیچ #lt[grub M2.5x9] نوارها را در جای خود محکم کنید.

        شماره قطعه: #lt[31]],
      [#image("images/subrack-utility/u13-1-full.jpg", width: 96%)],
      [#lt[4]],
      [برای ریل بک پلین مراحل بالا را تکرار کنید.

        شماره قطعات: #lt[3-8-32]],
      [#image("images/subrack-utility/u14-1.png", width: 96%)],
      [#lt[5]],
      [گسکت افقی را بر روی ریل به صورت کشویی نصب کنید. (مخصوص ریلهای جلویی و پشتی)

        شماره قطعه: #lt[10]],
      [#image("images/subrack-utility/u14-2.png", width: 96%)],
      [#lt[6]],
      [ریلها را بر روی یک عدد پنل جانبی به همراه براکت آن نصب کنید. ریل لبه دار در جلو-پایین و ریل بدون لبه در جلو-بالا نصب شوند. فاصله ریل بک پلین از ریل جلویی #lt[11] سوراخ باشد.

        شماره قطعه: #lt[1-2-4-5-40]],
      [#image("images/subrack-utility/u14-3.png", width: 96%)],
      [#lt[7]],
      [پنل جانبی و براکت های سمت دیگر را نصب کرده و تمام پیچ ها را سفت کنید.

        شماره قطعه: #lt[1-5-6-40]],
      [#image("images/subrack-utility/u15-1.png", width: 96%)],
      [#lt[8]],
      [دستگیرههای جلویی را در محل آنها نصب کنید.

        شماره قطعه : #lt[7-38]],
      [#image("images/subrack-utility/u15-2.jpg", width: 96%)],
      [#lt[9]],
      [گسکتهای #lt[EMC] را برروی براکت جلویی و پشتی نصب نمایید.

        شماره قطعه : #lt[12]],
      [#image("images/subrack-utility/u16-1.png", width: 96%)],
      [#lt[10]],
      [ریلهای راهنما مطابق شکل نصب شوند. از سمت راست به انداز ه #lt[4] سوراخ برروی ریل افقی با بدنه فاصله داده شود. باقی ریل ها نیز با فاصله #lt[4] سوراخ از یکدیگر نصب شوند.

        شماره قطعه : #lt[13]],
      [#image("images/subrack-utility/u16-2.png", width: 96%)],
      [#lt[11]],
      [توجه شود ریلهای بالا و پایین سابرک در محل نصب اتصالات #lt[ESD] متفاوت اند.],
      [#image("images/subrack-utility/u16-3.png", width: 96%)],
      [#lt[12]],
      [پنل پشتی را به همراه فنهای آن در قسمت پشت سابرک نصب شود.

        شماره قطعه : #lt[14]],
      [#image("images/subrack-utility/u17-1.png", width: 96%)],
      [#lt[13]],
      [برد بک پلین به همراه پیچهای #lt[M2.5x10] و نوار ایزوله برروی ریل بک پلین نصب شود.

        شماره قطعه : #lt[18-32]],
      [#image("images/subrack-utility/u17-2.jpg", width: 96%)],
      [#lt[14]],
      [پش از نصب گسکت کاور در شیار ریل ها، کاورهای بالا و پایین سابرک را نصب نمایید.

        شماره قطعه : #lt[11-15-39]],
      [#image("images/subrack-utility/u18-1.png", width: 96%)],
      [#lt[15]],
      [در سمت چپ سابرک دو عدد پنل کورکن نصب کنید.

        شماره قطعه : #lt[28]],
      [#image("images/subrack-utility/u18-2.png", width: 96%)],
      [#lt[16]],
      [کارتها را برروی پنلهای مربوط به آنها نصب کرده و در محل آنها قرار دهید.

        شماره قطعه : #lt[20-21-22-23-24-25-26-27]],
      [#image("images/subrack-utility/u18-3.png", width: 96%)],
    ),
    caption: [مراحل مونتاژ سابرک یوتیلیتی.],
  )
]
