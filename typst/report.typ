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
// algorithm reorders it — «01-SE40001-7» comes out as «SE40001-7-01».
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
      [#lt[01-SE40001-7]],
      [#image("images/subrack/p02-1.jpg", width: 94%)],
      [#lt[2]],
      [ریل افقی لبه بلند \
        #lt[Horizontal rail long lip]],
      [#lt[1]],
      [#lt[01-S0000RE]],
      [#image("images/subrack/p02-2.jpg", width: 94%)],
      [#lt[3]],
      [ریل افقی بک پلین \
        #lt[Horizontal rail for] \
        #lt[backplain]],
      [#lt[2]],
      [#lt[01-S0000RB]],
      [#image("images/subrack/p02-3.jpg", width: 94%)],
      [#lt[4]],
      [ریل افقی لبه کوتاه \
        #lt[Horizontal rail short lip]],
      [#lt[3]],
      [#lt[01-S0000RN]],
      [#image("images/subrack/p02-4.jpg", width: 94%)],
      [#lt[5]],
      [براکت جلویی \
        #lt[Bracket]],
      [#lt[2]],
      [#lt[01-SE4002]],
      [#image("images/subrack/p03-1.jpg", width: 94%)],
      [#lt[6]],
      [براکت پشتی \
        #lt[Rear angle]],
      [#lt[2]],
      [#lt[01-SE4003]],
      [#image("images/subrack/p03-2.jpg", width: 94%)],
      [#lt[7]],
      [دسته جلویی \
        #lt[Hangle]],
      [#lt[2]],
      [#lt[01-SE4004]],
      [#image("images/subrack/p03-3.png", width: 94%)],
      [#lt[8]],
      [نوار رزوه \
        #lt[Threaded insert]],
      [#lt[6]],
      [#lt[01-S0000TI]],
      [#image("images/subrack/p03-4-full.jpg", width: 94%)],
      [#lt[9]],
      [نوار سوراخدار \
        #lt[Perforated strip]],
      [#lt[4]],
      [#lt[01-S0000PS]],
      [#image("images/subrack/p04-1.jpg", width: 94%)],
      [#lt[10]],
      [گسکت افقی \
        #lt[Horizontal EMC gasket]],
      [#lt[4]],
      [#lt[01-S0000GH]],
      [#image("images/subrack/p04-2.jpg", width: 94%)],
      [#lt[11]],
      [گسکت کاور \
        #lt[Cover EMC gasket]],
      [#lt[4]],
      [#lt[01-S0000GC]],
      [#image("images/subrack/p04-3.jpg", width: 94%)],
      [#lt[12]],
      [گسکت عمودی \
        #lt[Vertical EMC gasket]],
      [#lt[22]],
      [#lt[01-S0000GV]],
      [#image("images/subrack/p04-4.png", width: 94%)],
      [#lt[13]],
      [ریل راهنما \
        #lt[Guide rail]],
      [#lt[19/19]],
      [#lt[01-AG220-0] \
        & \
        #lt[01-AG220-1]],
      [#image("images/subrack/p05-1.png", width: 94%)],
      [#lt[14]],
      [پنل پشتی \
        #lt[Rear panel]],
      [#lt[1]],
      [#lt[109-01-AF430-G-V1]],
      [#image("images/subrack/p05-2.jpg", width: 94%)],
      [#lt[15]],
      [کاور \
        #lt[Cover]],
      [#lt[2]],
      [#lt[109-01-S0000C1-7]],
      [#image("images/subrack/p05-3.jpg", width: 94%)],
      [#lt[16]],
      [براکت فن \
        #lt[Fan bracket]],
      [#lt[1]],
      [#lt[109-01-S000003]],
      [#image("images/subrack/p05-4.jpg", width: 94%)],
      [#lt[17]],
      [محافظ فن \
        #lt[Fan shield]],
      [#lt[3]],
      [\-],
      [#image("images/subrack/p06-1.jpg", width: 94%)],
      [#lt[18]],
      [فن دی سی ۶۰\*۶۰ \
        #lt[60x60 DC fan]],
      [#lt[5]],
      [#lt[AFB0605MC]],
      [#image("images/subrack/p06-2.png", width: 94%)],
      [#lt[19]],
      [نوار ایزوله بک پلین \
        #lt[Isolation strip]],
      [#lt[2]],
      [#lt[01-S0000IS]],
      [#image("images/subrack/p06-3.png", width: 94%)],
      [#lt[20]],
      [بست کابل \
        #lt[Cable clamp]],
      [#lt[9]],
      [#lt[109-01-S000009]],
      [#image("images/subrack/p06-4.jpg", width: 94%)],
      [#lt[21]],
      [کانکتور تغذیه #lt[C14] فیوزدار \
        #lt[C14 fused connector]],
      [#lt[2]],
      [#lt[KM01.1205.11]],
      [#image("images/subrack/p07-1.png", width: 94%)],
      [#lt[22]],
      [کیت پنل #lt[CPU] \
        #lt[CPU panel kit]],
      [#lt[1]],
      [#lt[109-01-AC420-0-V2]],
      [#image("images/subrack/p07-2.jpg", width: 94%)],
      [#lt[23]],
      [کیت پنل تغذیه \
        #lt[Power supply panel kit]],
      [#lt[2]],
      [#lt[109-01-AC430-4-V1]],
      [#image("images/subrack/p07-3.jpg", width: 94%)],
      [#lt[24]],
      [کیت پنل #lt[RF] \
        #lt[RF panel kit]],
      [#lt[16]],
      [#lt[109-01-AC420-0-V1]],
      [#image("images/subrack/p08-1.jpg", width: 94%)],
      [#lt[25]],
      [صفحه نصب \
        #lt[Mounting plate]],
      [#lt[1]],
      [#lt[109-01-AMP00]],
      [#image("images/subrack/p08-2.jpg", width: 94%)],
      [#lt[26]],
      [#lt[Cross recess collar screw] \
        #lt[M2.5x12]],
      [#lt[48]],
      [\-],
      [#image("images/subrack/p08-3.jpg", width: 94%)],
      [#lt[27]],
      [#lt[Cross recess] \
        #lt[countersunk screw] \
        #lt[M2.5x8]],
      [#lt[19]],
      [\-],
      [#image("images/subrack/p09-1.jpg", width: 94%)],
      [#lt[28]],
      [#lt[Grub screw M2.5x9]],
      [#lt[12]],
      [\-],
      [#image("images/subrack/p09-2.jpg", width: 94%)],
      [#lt[29]],
      [#lt[Cross recess screw M3x8]],
      [#lt[16]],
      [\-],
      [#image("images/subrack/p09-3.jpg", width: 94%)],
      [#lt[30]],
      [#lt[Cross recess screw] \
        #lt[M2.5x12]],
      [#lt[12]],
      [\-],
      [#image("images/subrack/p09-4.jpg", width: 94%)],
      [#lt[31]],
      [#lt[Cross recess screw] \
        #lt[M2.5x8]],
      [#lt[24]],
      [\-],
      [#image("images/subrack/p09-5.jpg", width: 94%)],
      [#lt[32]],
      [#lt[Cross recess screw] \
        #lt[M4x30]],
      [#lt[20]],
      [\-],
      [#image("images/subrack/p10-1.jpg", width: 94%)],
      [#lt[33]],
      [#lt[M4 nut]],
      [#lt[20]],
      [\-],
      [#image("images/subrack/p10-2.jpg", width: 94%)],
      [#lt[34]],
      [#lt[M4 spring washer]],
      [#lt[20]],
      [\-],
      [#image("images/subrack/p10-3.jpg", width: 94%)],
      [#lt[35]],
      [#lt[M4 flat washer]],
      [#lt[20]],
      [\-],
      [#image("images/subrack/p10-4.jpg", width: 94%)],
      [#lt[36]],
      [#lt[Sleeve]],
      [#lt[31]],
      [\-],
      [#image("images/subrack/p10-5.png", width: 94%)],
      [#lt[37]],
      [#lt[Countersunk torx M5x12]],
      [#lt[4]],
      [\-],
      [#image("images/subrack/p11-1.jpg", width: 94%)],
      [#lt[38]],
      [#lt[Torx M4x6]],
      [#lt[56]],
      [\-],
      [#image("images/subrack/p11-2.jpg", width: 94%)],
      [#lt[39]],
      [#lt[Torx m4x12 self-lock]],
      [#lt[24]],
      [\-],
      [#image("images/subrack/p11-3.jpg", width: 94%)],
      [#lt[40]],
      [#lt[M2.5 washer]],
      [#lt[24]],
      [\-],
      [#image("images/subrack/p11-4.jpg", width: 94%)],
    ),
    caption: [معرفی قطعات سابرک گیرنده.],
  )
]

= دستورالعمل مونتاژ

#long-table[
  #figure(
    table(
      columns: (1.26fr, 3.70fr, 5.04fr),
      align: center + horizon,
      table.header(repeat: true, [مرحله], [توضیحات], [تصویر]),
      [۱],
      [فن ها را با استفاده از پیچ #lt[M4] برروی براکت نصب کنید.

        شماره قطعه: #lt[16-18-32-33-34-35]],
      [#image("images/subrack/p12-1-full.jpg", width: 96%)],
      [۲],
      [مطابق شکل، نگهدارنده پیچ (#lt[sleeve]) و پیچ‌های مربوطه را بر روی پنل پشت نصب کنید.

        شماره قطعه: #lt[14-26-36]],
      [#image("images/subrack/p13-1-full.jpg", width: 96%)],
      [۳],
      [فن و محافظ فن را بر روی پنل پشتی نصب کنید.

        شماره قطعه: #lt[16-17-18-32-33-34-35]],
      [#image("images/subrack/p13-3-full.jpg", width: 96%)],
      [۴],
      [گسکت افقی را مانند شکل بر روی لبه جلویی ریل‌های لبه دار قرار دهید. دقت کنید که فاصله‌ی گسکت از لبه‌های ریل برابر باشد. گسکت‌های افقی تنها برای ریل‌های لبه دار استفاده می‌شوند و ریل‌های بک پلین فاقد گسکت هستند.

        شماره قطعه: #lt[10] و #lt[2]],
      [#image("images/subrack/p14-1-full.jpg", width: 96%)],
      [۵],
      [با استفاده از ابزار مخصوص، قسمت پایینی گسکت را به آرامی فشار دهید تا در محل مخصوص خود قرار گیرد. دقت شود که در این مرحله قسمت بالایی از شیار خارج نشود.],
      [#image("images/subrack/p14-3-full.jpg", width: 96%)],
      [۶],
      [نوار رزوه دار و نوار سوراخدار را در محل آن برروی ریل ها قرار دهید. برای ریل بک پلین تنها از نوار سوراخدار استفاده شود.

        شماره قطعه: #lt[2-8-9]],
      [#image("images/subrack/p15-1.jpg", width: 96%)],
      [۷],
      [با استفاده از پیچ #lt[grub M2.5x9] نوارها را در جای خود محکم کنید. محل نصب پیچ‌ها سوراخ ابتدایی و انتهایی می‌باشد. خروجی این مرحله یک پیش مونتاژ از ریل‌ها، گسکت‌ها و نوارهای رزوه و سوراخدار می‌باشد.

        شماره قطعه: #lt[28]],
      [#image("images/subrack/p15-2-full.jpg", width: 96%)],
      [۸],
      [برای ریل‌های بک پلین نیز مراحل بالا را تکرار کنید. توجه شود برروی ریل‌های بک پلین گسکت نصب نمی‌شود.

        شماره قطعات: #lt[3-8-28]],
      [#image("images/subrack/p16-1-full.jpg", width: 96%)],
      [۹],
      [یک عدد ریل بک پلین و یک عدد ریل لبه بلند را مطابق شکل به موازات یکدیگر قرار دهید.],
      [#image("images/subrack/p16-3.jpg", width: 96%)],
      [۱۰],
      [لبه ریل‌ها را به سمت خود قررا داده و ریل‌های راهنما مربوط به جهت پایین را مطابق آرایش تصویر برروی آنها نصب کنید. یک ریل در سمت چپ قرار داده سپس ۴ سوراخ فاصله دهید و سایر ریل‌ها را نصب کنید. اتصالات فلزی نصب شده برروی ریل‌های راهنما باید به سمت جلو باشد. توجه شود برروی سوراخ نصفه لبه ریل‌ها نباید چیزی نصب شود.

        شماره قطعه: #lt[13]],
      [#image("images/subrack/p17-1-full.jpg", width: 96%)],
      [۱۱],
      [این مجموعه پیش مونتاژی که شامل ریل بک پلین و ریل لبه بلند است در مراحل آتی در قسمت پایین سابرک استفاده خواهد شد.],
      [#image("images/subrack/p18-1.jpg", width: 96%)],
      [۱۲],
      [مشابه مرحله پیش مونتاژ قبل، یک ریل لبه کوتاه و یک ریل بک پلین را مطابق شکل مقابل هم قرار دهید.],
      [#image("images/subrack/p18-2.jpg", width: 96%)],
      [۱۳],
      [مشابه پیش مونتاژ قبل، ریل ها را برروی ریل‌های افقی نصب کنید. تفاوت این مرحله با پیش مونتاژ قبل این است که جهت نصب ریل‌ها معکوس بوده و از ریل‌های راهنمای جهت بالا استفاده می‌شود. یک ریل را در سمت راست نصب کرده سپس ۴ سوراخ فاصله داده و باقی ریل‌ها را نصب کنید.

        شماره قطعه: #lt[13]],
      [#image("images/subrack/p19-1-full.jpg", width: 96%)],
      [۱۴],
      [دستگیره و گسکت عمودی را برروی براکت‌های جلویی نصب کنید.

        شماره قطعه: #lt[5-7-12-37]],
      [#image("images/subrack/p20-1-full.jpg", width: 96%)],
      [۱۵],
      [پنل‌های جانبی را طبق جهت نشان داده شده در شکل برروی پایه‌های فیکسچر نصب نمایید. جهت فلش به سمت بالا بوده و دقت شود که در قسمت پایین ردیف‌های سوراخ بیشتر است. همچنین توجه شود که برآمدگی‌های روی پنل به سمت داخل قرار گیرند.],
      [#image("images/subrack/p21-1.jpg", width: 96%)],
      [۱۶],
      [مجموعه پیش مونتاژی شامل ریل لبه کوتاه را در قسمت بالا قرار داده و براکت بدون گسکت را در محل خود (وجه راست سابرک) گذاشته و پیچ‌های مخصوص آن را ببندید.

        شماره قطعه: #lt[39]],
      [#image("images/subrack/p21-2-full.jpg", width: 96%)],
      [۱۷],
      [در سمت چپ براکت شامل گسکت را در محل خود (وجه چپ سابرک) قرار داده و پیچ‌ها را ببندید.

        شماره قطعه: #lt[39]],
      [#image("images/subrack/p22-1-full.jpg", width: 96%)],
      [۱۸],
      [پس از نصب براکت ها پیچ‌های ریل بک‌پلین را ببندید. توجه شود پیچ‌ها شل بسته شوند.

        شماره قطعه: #lt[39]],
      [#image("images/subrack/p22-3.jpg", width: 96%)],
      [۱۹],
      [سابرک را بچرخانید و پیش مونتاژ شامل ریل لبه بلند را در قسمت زیر سابرک نصب کنید. توجه شود پیچ‌ها شل بسته شوند.],
      [#image("images/subrack/p23-1.jpg", width: 96%)],
      [۲۰],
      [نوار ایزوله را برروی ریل بک پلین قرار داده و سپس برد بک پلین را با استفاده از پیچ ۲٫۵ سایز ۱۲ میلیمتر و واشر فنری و واشر تخت در محل خود به صورت شل ببندید. به جهت برد بک پلین دقت شود که کانکتورهای پاور ورودی باید به سمت پایین سابرک باشند.

        شماره قطعه: #lt[19-30-40]],
      [#image("images/subrack/p23-2-full.jpg", width: 96%)],
      [۲۱],
      [بردهای تست را در ریل اول و آخر قرار دهید و ابتدا روان بودن آنها را تست کرده و در صورت سفت بودن بدنه را ریگلاژ کنید. سپس ریل ها را بسته و بردهای تست را برروی بک‌پلین جا زده و پیچ‌های برد بک‌پلین را سفت کنید.],
      [],
      [۲۲],
      [نگهدارندههای کابل را در محل خود طبق آرایش مربوطه برروی صفحه نصب قرار دهید.

        شماره قطعه: #lt[25-20]],
      [#image("images/subrack/p24-1.jpg", width: 96%)],
      [۲۳],
      [صفحه نصب را در محل خود تنها با ۲ پیچ ابتدایی و انتهایی در هر طرف نصب کنید. پیچ‌ها در این مرحله شل بسته شوند.

        شماره قطعه: #lt[38]],
      [#image("images/subrack/p24-2-full.jpg", width: 96%)],
      [۲۴],
      [به محل نصب صفحه نصب دقت شود. محل آن اولین ردیف سوراخ مربعی از سمت پایین سابرک می‌باشد.],
      [#image("images/subrack/p25-1.jpg", width: 96%)],
      [۲۵],
      [ریل‌های لبه کوتاه و براکت‌ها را در قسمت پشت سابرک نصب نمایید. توجه شود براکت شامل گسکت باید در وجه راست قرار گیرد.

        شماره قطعه: #lt[39-6]],
      [#image("images/subrack/p25-2-full.jpg", width: 96%)],
      [۲۶],
      [محل پیچ‌های صفحه نصب را به صورت چشمی در مرکز سوراخ مربعی قرار داده و تمامی پیچ‌های آن را سفت کنید.

        شماره قطعه: #lt[38]],
      [#image("images/subrack/p26-1-full.jpg", width: 96%)],
      [۲۷],
      [براکت فن پیش‌مونتاژ شده را در محل خود نصب کنید. جهت نصب مطابق تصویر باشد.

        شماره قطعه: #lt[38]],
      [#image("images/subrack/p27-1.jpg", width: 96%)],
      [۲۸],
      [دقت شود محل نصب براکت فن در محل لبه جلویی صفحه نصب می‌باشد.],
      [#image("images/subrack/p27-2-full.jpg", width: 96%)],
      [۲۹],
      [گسکت‌های #lt[EMC] مربوط به کاور را در شیار ریل‌های افقی نصب نمایید.

        شماره قطعه #lt[11]:],
      [#image("images/subrack/p28-1-full.jpg", width: 96%)],
      [۳۰],
      [پنل پشتی را به همراه فن‌های آن در قسمت پشت سابرک نصب شود.

        شماره قطعه #lt[14]:],
      [#image("images/subrack/p28-3.jpg", width: 96%)],
      [۳۱],
      [کاورهای بالا و پایین سابرک را نصب نمایید.

        شماره قطعه #lt[15-38]:],
      [#image("images/subrack/p29-1.jpg", width: 96%)],
      [۳۲],
      [پنل‌های جلویی را طبق آرایش مربوط در محل آنها قرار دهید.

        شماره قطعه #lt[21-22-23-24]:],
      [#image("images/subrack/p29-2.jpg", width: 96%)],
    ),
    caption: [مراحل مونتاژ سابرک گیرنده.],
  )
]
