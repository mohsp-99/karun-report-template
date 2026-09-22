// =============================================================================
// report.typ — the Pargar-ODM business architecture & service-model guide.
//
// Persian (RTL), hand-numbered in the FA-STYLE house style: section numbers
// live in the heading text, table captions sit above, figure captions below.
// See FA-STYLE.md for the setup block, the local helpers and the bidi rules
// (sn / lt / nb); karun-fa-style.typ holds the shared machinery.
//
// Build from typst/:
//   typst compile --font-path fonts report.typ \
//     "build/PARGAR-ODM-GUIDE-V1 - راهنمای معماری و مدل خدمات پرگار.pdf"
// =============================================================================

#import "karun.typ": *
#import "metadata.typ": meta

#show: karun-report.with(lang: "fa", meta: meta)

// Dubai is the company body font, where the engine sets B Nazanin for Persian.
// This MUST come before the title and contents pages, or the cover, the
// metadata table and the table of contents stay in B Nazanin while the body
// runs in Dubai.
#set text(font: "Dubai")

#title-page(meta, lang: "fa")

// The engine's leading is tuned for B Nazanin's tall line-box; in Dubai the
// contents entries sit almost on top of each other. Open the gap between
// entries — this affects the outline only.
#show outline.entry: it => block(above: 12pt, below: 0pt, it)
#contents-page(lang: "fa")

#import "karun-fa-style.typ": *
#import "karun-diagrams.typ": comparison, dg-navy, dg-pale, dg-line, dg-ink, dg-mid
#show: fa-refine

// Dubai's shorter line-box again: these values land the same ~1.5x line
// spacing the engine gives B Nazanin.
#set text(size: 11.5pt)
#set par(leading: 0.82em, spacing: 1.3em)

// Numbered lists count in Persian digits, matching the hand-typed section
// numbers around them.
#show: fa-enum

// A diagram must never be split from its caption.
#show figure.where(kind: image): set block(breakable: false)

// --- Per-report local helpers (FA-STYLE.md §3) ------------------------------

// Level-1 sections open a new page — by an explicit call before each heading
// rather than a blanket show rule, so short sections can be exempted. `weak`
// makes it a no-op when the section already starts a page.
#let newsec() = pagebreak(weak: true)

// Table caption — ABOVE the table: centred, 9.5pt, Karun blue, `sticky` so it
// cannot be separated from the table it introduces.
#let tbl-caption(body) = block(above: 14pt, below: 6pt, width: 100%, sticky: true)[
  #set align(center)
  #set par(justify: false)
  #text(size: 9.5pt, fill: karun-blue, weight: "medium")[#body]
]

// Keeps a mixed Latin/Persian token whole — «۳D CAD» — while leaving it laid
// out right to left, so the Persian digit stays on the right.
#let nb(body) = box(body)

// A wholly Latin technical token. A token opening with digits is bidi class EN,
// so the space before its unit resolves to the paragraph level and an RTL line
// renders it reversed. The LTR box pins the order and keeps the token whole.
#let lt(body) = box(text(dir: ltr, body))

// --- Per-report diagram helpers ---------------------------------------------
// The source carries three ASCII box-drawings. They are redrawn here with the
// brand palette rather than pasted as monospace art: the bundled faces have no
// monospace companion that can shape Arabic script, so box-drawing art would
// come out as broken lines around disconnected letters.

// Vertical input → process → output stack (the «جعبه سیاه» figure). The middle
// panel is the dark one — it is the thing the diagram is about. `core-items`
// are laid out two per row; in RTL the grid fills right-to-left, so they read
// in source order.
#let io-stack(in-title, in-body, core-title, core-items, out-title, out-body) = {
  let end-panel(title, body) = box(
    width: 100%, radius: 8pt, fill: dg-pale, stroke: 0.75pt + dg-line,
    inset: (x: 14pt, y: 11pt),
    align(center, {
      text(weight: "bold", size: 11.5pt, fill: karun-blue)[#title]
      v(4pt, weak: true)
      text(size: 9.5pt, fill: dg-ink)[#body]
    }),
  )
  let arrow = align(center, box(height: 0.55cm, inset: (y: 2pt),
    polygon(fill: dg-mid, (0pt, 0pt), (13pt, 0pt), (6.5pt, 11pt))))
  block(width: 100%, breakable: false, stack(dir: ttb, spacing: 5pt,
    end-panel(in-title, in-body),
    arrow,
    box(width: 100%, radius: 8pt, fill: dg-navy, inset: (x: 16pt, y: 13pt), {
      align(center, text(weight: "bold", size: 12pt, fill: white)[#core-title])
      v(8pt, weak: true)
      set text(size: 9.5pt, fill: white.transparentize(8%))
      grid(columns: (1fr, 1fr), column-gutter: 14pt, row-gutter: 6pt,
        ..core-items.map(i => [#sym.bullet #h(3pt) #i]))
    }),
    arrow,
    end-panel(out-title, out-body),
  ))
}

// One root over N children, each a titled panel with a bullet list. The
// karun-diagrams `hierarchy` is LTR-biased (its child text is flush left); this
// is the same shape with the text on the RTL reading edge and an English
// gloss line under each child title. The connector geometry is symmetric, so
// it needs no mirroring.
#let fa-hierarchy(root, ..children) = {
  let kids = children.pos()
  let m = kids.len()
  let rail = 1.4pt + dg-line
  let root-box = align(center, box(
    fill: dg-navy, radius: 8pt, inset: (x: 18pt, y: 10pt),
    text(fill: white, weight: "bold", size: 12pt)[#root],
  ))
  if m == 0 { return block(width: 100%, root-box) }

  let connector = box(width: 100%, height: 0.8cm, {
    place(top + center, line(start: (0pt, 0pt), end: (0pt, 0.4cm), stroke: rail))
    let x0 = (0.5 / m) * 100%
    let x1 = ((m - 0.5) / m) * 100%
    place(top + left, dx: x0, dy: 0.4cm,
      line(start: (0pt, 0pt), end: (x1 - x0, 0pt), stroke: rail))
    for i in range(m) {
      place(top + left, dx: ((i + 0.5) / m) * 100%, dy: 0.4cm,
        line(start: (0pt, 0pt), end: (0pt, 0.4cm), stroke: rail))
    }
  })

  let cells = ()
  for k in kids {
    let title = k.at("title", default: "")
    let sub = k.at("sub", default: none)
    let list = k.at("items", default: ())
    cells.push(box(
      width: 100%, radius: 8pt, fill: dg-pale, stroke: 0.75pt + dg-line,
      inset: 0pt, clip: true, {
        block(width: 100%, fill: karun-blue, inset: (x: 11pt, y: 8pt),
          above: 0pt, below: 0pt, align(center, {
            text(fill: white, weight: "bold", size: 10.5pt)[#title]
            if sub != none {
              v(2pt, weak: true)
              text(fill: white.transparentize(25%), size: 8pt)[#sub]
            }
          }))
        pad(x: 12pt, y: 10pt, {
          set align(start)
          set text(fill: dg-ink, size: 9.5pt)
          for li in list { block(spacing: 5pt, [#sym.bullet #h(3pt) #li]) }
        })
      },
    ))
  }

  block(width: 100%, breakable: false, {
    root-box
    connector
    grid(columns: (1fr,) * m, column-gutter: 10pt, align: top, ..cells)
  })
}

// A ✓/✗ list for the two panels of the scope-boundary comparison. The glyphs
// are the source document's own (U+2713 / U+2717); both are covered by the
// bundled faces, and they carry matching visual weight.
#let marks(sign, color, ..items) = {
  set par(justify: false, leading: 0.6em)
  stack(dir: ttb, spacing: 7pt, ..items.pos().map(i => grid(
    columns: (auto, 1fr), column-gutter: 6pt, align: (top, top),
    text(fill: color, weight: "bold")[#sign], i,
  )))
}

// ===========================================================================
// CONTENT
// ===========================================================================

#note[
  *مخاطب سند:* تیم‌های بازاریابی، تولید محتوا، ارتباطات، توسعه بازار و مدیران
  غیرفنی.

  *هدف سند:* ایجاد یک مرجع مفهومی ساده، روان و یکدست برای تدوین بروشورها،
  صفحات فرود وب‌سایت، پست‌های شبکه‌های اجتماعی و مذاکرات فروش B2B.
]

= ۱. پرگار چیست؟ (تعریف کسب‌وکار در یک نگاه)

پرگار یک پلتفرم هوشمند «ساخت بر اساس تقاضا» (On-Demand Manufacturing) است که با
سرمایه‌گذاری شرکت کارون راه‌اندازی شده است. پرگار خودش یک کارگاه تراشکاری یا
سوله تولیدی سنتی نیست؛ بلکه شبکه‌ای گسترده و دست‌چین‌شده از معتبرترین
کارگاه‌های تخصصی صنعتی کشور را مدیریت و هماهنگ (ارکستره) می‌کند.

== #sn[۱-۱.] مسئله بازار سنتی چیست؟

در حالت عادی، وقتی یک شرکت صنعتی یا تیم تحقیق و توسعه (R\&D) می‌خواهد یک قطعه یا
دستگاه صنعتی جدید بسازد، گرفتار یک چرخه فرسایشی می‌شود:

- باید به طور جداگانه با تراشکار CNC، خم‌کار ورق، کارگاه ریخته‌گری، واحد عملیات
  حرارتی و کارگاه رنگ‌آمیزی چانه‌زنی کند.

- کارگاه‌ها اصطلاحات یکدیگر را قبول ندارند؛ اگر قطعه نهایی ایراد پیدا کند،
  تراشکار مقصر را متریال می‌داند و آبکار مقصر را تراشکار!

- کارفرما بخش زیادی از زمان مفید خود را صرف پیگیری تلفنی، پاس‌کاری خطاها و حل
  ناهماهنگی‌ها می‌کند.

== #sn[۱-۲.] راه‌حل پرگار: «تنها شریک پاسخگو» (Single Accountable Partner)

پرگار این اصطکاک بزرگ را حذف کرده است. مشتری به جای کار با ده‌ها کارگاه و
سردرگمی میان فاکتورها، فقط با پرگار طرف است. پرگار کل مسئولیت مهندسی، کنترل
کیفیت، لجستیک و زمان‌بندی را بر عهده می‌گیرد و محصول بی‌نقص نهایی را همراه با
تضمین صددرصدی به مشتری تحویل می‌دهد.

#newsec()
= ۲. مفهوم «جعبه سیاه»: چرا کار با پرگار برای مشتری ساده و جذاب است؟

از دید یک مدیر خرید یا مهندس محصول، هیچ اهمیتی ندارد که قطعه او در کدام کارگاه،
در کدام شهر یا روی چه مدل دستگاهی تراشیده شده است. کارفرما فقط به دنبال *کیفیت
دقیق، قیمت منطقی و تحویل سروقت* است.

#lead[
  به همین دلیل، پرگار از نگاه مشتری یک *«جعبه سیاه مطمئن» (Black Box)* است:
]

#fa-diagram(
  io-stack(
    [ورودی‌های مشتری],
    [نمونه واقعی، مدل #nb[۳D]، نقشه #nb[۲D]],
    [جعبه سیاه پرگار],
    (
      [ارزیابی مهندسی قابلیت ساخت (DFx)],
      [توزیع هوشمند سفارش میان کارگاه‌های تخصصی شبکه],
      [نظارت بر نقاط اتصال فرآیندها (Handoffs)],
      [اعمال ۱۰ گیت بازرسی و کنترل کیفیت سخت‌گیرانه (QC)],
    ),
    [خروجی‌های تضمین‌شده],
    [مستندات ساخت، پروتوتایپ، تیراژ],
  ),
  caption: [پرگار از نگاه مشتری: ورودی‌های مجاز، جعبه سیاه و خروجی‌های تضمین‌شده.],
)

== #sn[۲-۱.] ورودی‌های مجاز که مشتری می‌تواند ارائه دهد

+ *یک نمونه قطعه فیزیکی:* مشتری نمونه‌ای واقعی (معمولاً خارجی یا ساخت داخل) در
  اختیار دارد که نقشه ندارد و خواهان نمونه‌سازی و بومی‌سازی آن است (مهندسی
  معکوس).

+ *یک فایل سه‌بعدی کامپیوتری (#nb[۳D CAD]):* فایل دیجیتال طراحی‌شده توسط مهندسان
  مشتری در نرم‌افزارهای مهندسی (مانند SolidWorks، CATIA و...).

+ *یک نقشه فنی دوبعدی (#nb[۲D Drawing]):* نقشه‌های مهندسی استاندارد که حاوی
  مشخصات متریال، ابعاد و تلرانس‌های هندسی و ابعادی (GD\&T) هستند.

== #sn[۲-۲.] خروجی‌های معینی که پرگار تحویل می‌دهد

+ *مستند کامل ساخت:* نقشه‌های اجرایی #nb[۲D] استاندارد، مدل‌های سه‌بعدی
  اصلاح‌شده، شناسنامه متالورژی و دستورالعمل‌های کنترل کیفیت.

+ *یک نمونه قطعه ساخته‌شده (پروتوتایپ اعتبارسنجی):* ساخت یک عدد قطعه اولیه فیزیکی
  برای لمس کیفیت و تست انطباق قبل از شروع تولید اصلی.

+ *قطعات تولیدشده در تعداد مشخص و محدود:* تولید تیراژهای سفارشی، محدود و دقیق
  (معمولاً از چند ده عدد تا چند صد عدد) متناسب با نیاز خط تولید کارفرما.

#newsec()
= ۳. دو خدمت محوری و بنیادین پرگار (Core Services)

#lead[
  پلتفرم پرگار تمامی نیازهای صنعت را در دو خدمت مستقل اما مکمل پاسخ می‌دهد. مشتری
  بسته به مرحله پروژه خود می‌تواند یکی از این خدمات یا هر دوی آن‌ها را به صورت
  متوالی انتخاب کند:
]

#fa-diagram(
  fa-hierarchy(
    [پلتفرم مرکزی پرگار],
    (
      title: [خدمت ۱: مهندسی ساخت],
      sub: [Manufacturing Engineering],
      items: (
        [ممیزی قابلیت ساخت (DFM)],
        [مهندسی معکوس و اسکن],
        [بهینه‌سازی هزینه تولید],
        [ساخت تک‌نمونه اعتبارسنجی],
      ),
    ),
    (
      title: [خدمت ۲: ساخت و تولید],
      sub: [Manufacturing Orchestration],
      items: (
        [مدیریت شبکه کارگاه‌ها],
        [کنترل کیفیت ۱۰ مرحله‌ای],
        [مونتاژ مکانیکی هندسی],
        [تحویل قطعات نهایی],
      ),
    ),
  ),
  caption: [دو خدمت محوری پلتفرم پرگار و سرفصل‌های هر یک.],
)

== #sn[۳-۱.] خدمت اول: «مهندسی ساخت» (Manufacturing Engineering)

*توصیف ساده:* بسیاری از قطعاتی که توسط مهندسان طراحی می‌شوند، در نرم‌افزار
بی‌نقص به نظر می‌رسند اما هنگام ورود به کارگاه، ساخت آن‌ها یا غیرممکن است یا
هزینه‌های نامعقولی می‌تراشد (مثلاً به دلیل لبه‌های تیز غیرقابل ماشین‌کاری،
زوایای بسته یا تلرانس‌های بیش از حد سخت‌گیرانه). در این خدمت، مهندسان پرگار طرح
را از منظر تولید بازبینی و اصلاح می‌کنند تا طرح برای تولید با دستگاه‌های صنعتی،
بهینه، سریع و کم‌هزینه شود. اگر مشتری نقشه‌ای نداشته باشد و فقط قطعه فیزیکی
داشته باشد، پرگار آن را اسکن، آنالیز متالورژی و نقشه‌برداری می‌کند.

*خروجی‌های خدمت:*

- پکیج اسناد نهایی ساخت (نقشه‌های #nb[۲D]، مدل #nb[۳D] تمیز و چک‌لیست ابعادی).

- _(در صورت تمایل کارفرما)_ ساخت یک نمونه فیزیکی اولیه برای صحه‌گذاری عملیاتی.

*ساختار قیمت‌گذاری در پیش‌فاکتور:* این خدمت در قالب ردیف مجزای *هزینه‌های
غیرتکرارشونده (NRE)* محاسبه می‌شود؛ هزینه‌ای که یک‌بار برای همیشه جهت
آماده‌سازی طرح پرداخت می‌گردد.

*شعار و پیام کلیدی برای مشتری:*

#note[
  _«پیش از صرف هزینه‌های سنگین در کارگاه، نقشه‌های خود را برای ساخت صنعتی
  بی‌نقص، دقیق و اقتصادی کنید.»_
]

== #sn[۳-۲.] خدمت دوم: «ساخت و تولید» (Manufacturing Orchestration)

*توصیف ساده:* این خدمت ویژه طرح‌هایی است که نقشه‌های ساخت و مشخصات فنی آن‌ها
آماده و منجمد شده است. پرگار کلیه مراحل تولید فیزیکی قطعه را بر عهده می‌گیرد.
این مراحل می‌تواند شامل تراشکاری و فرزکاری دقیق CNC، برش لیزر و خم‌کاری ورق،
ریخته‌گری، عملیات حرارتی، پوشش‌دهی و آبکاری، و مونتاژ اجزای مکانیکی (جا زدن پین،
بستن پیچ با گشتاور مشخص) باشد.

*خروجی‌های خدمت:* تحویل فیزیکی قطعات سفارشی ساخته‌شده، در تعداد مورد نظر، همراه
با گزارش بازرسی ابعادی و تضمین تطابق کامل با نقشه.

*ساختار قیمت‌گذاری در پیش‌فاکتور:* این خدمت بر مبنای *هزینه به ازای هر واحد قطعه
(Unit Cost)* به همراه هزینه‌های جانبی آزمون و بسته‌بندی ارائه می‌شود.

*شعار و پیام کلیدی برای مشتری:*

#note[
  _«زنجیره تأمین، هماهنگی کارگاه‌ها و کنترل کیفیت را به ما بسپارید؛ قطعه آماده
  را سرموعد و با گارانتی کامل تحویل بگیرید.»_
]

// No #newsec(): a short section, run on from ۳ (FA-STYLE §4.1).
= ۴. زیرمجموعه‌های تخصصی پرگار (راه‌حل‌های عمودی بازار)

پرگار دو خدمت پایه خود را برای *انواع قطعات مکانیکی عمومی* (شفت، چرخدنده، بوش،
پوسته پمپ، فریم‌های مهندسی و...) عرضه می‌کند. با این حال، برای پوشش نیازهای خاص
برخی از بخش‌های بازار، زیرمجموعه‌های تخصصی با تمرکز ویژه ایجاد شده‌اند:

== #sn[۴-۱.] زیرمجموعه اول: «پرگار-انکلوژر» (Pargar-Enclosure)

*مسئله مشتریان هدف:* شرکت‌های طراح و تولیدکننده بردهای الکترونیکی، تجهیزات
مخابراتی، دستگاه‌های پزشکی و سامانه‌های اینترنت اشیاء (IoT)، تخصص اصلی‌شان در
مدار و نرم‌افزار است. این تیم‌ها معمولاً درگیر چالش‌های ساخت بدنه، جعبه‌های فلزی
و باکس‌های صنعتی استاندارد می‌شوند و دانش یا تجهیزات مکانیکی لازم را ندارند.

*راه‌حل پرگار-انکلوژر:* ارائه راهکار متمرکز طراحی برای ساخت و تولید انواع
کیس‌ها، محفظه‌ها (Enclosures) و ساب‌رک‌های صنعتی (Sub-racks):

- *کیفیت معادل برندهای مطرح اروپایی:* دقت بالا در ورق‌کاری، ظرافت خم‌ها، مونتاژ
  دقیق ریل‌ها و رنگ‌آمیزی الکترواستاتیک صنعتی بدون نقص ظاهری.

- *تست‌های اطمینان‌بخش آب‌بندی:* کنترل ابعادی شیار اورینگ‌ها بر اساس استانداردهای
  بین‌المللی و انجام آزمون نشتی فرآیندی جهت اطمینان از صحت ساخت.

- *حذف کامل چالش‌های واردات:* تأمین داخلی پایدار، حذف ریسک‌های تخصیص ارز و ترخیص
  گمرکی، و کاهش دوره انتظار تأمین کالا.

#newsec()
= ۵. مرزهای فعالیت پرگار (چه کارهایی در اسکوپ ما نیست؟)

#lead[
  برای جلوگیری از سردرگمی تیم فروش و ارائه وعده‌های اشتباه به مشتریان، رعایت این
  مرزبندی‌ها ضروری است:
]

#fa-diagram(
  comparison(
    (
      title: [پرگار چه چیزی هست؟],
      accent: dg-navy,
      body: marks([✓], dg-navy,
        [ارکستراتور ساخت قطعات سفارشی صنعتی],
        [ارزیابی و اصلاح نقشه‌ها برای تولید],
        [مسئولیت‌پذیری کامل در انطباق نقشه],
        [متخصص سفارش‌های با تنوع بالا و تیراژ],
      ),
    ),
    (
      title: [پرگار چه چیزی نیست؟],
      accent: rgb(108, 120, 136),
      body: marks([✗], rgb(108, 120, 136),
        [دفتر طراحی اختراع و ایده مفهومی],
        [کارگاه سنتی تولید قطعات ساده ارزان],
        [پذیرنده ریسک عملکردی کل دستگاه],
        [خط تولید انبوه چند ده هزار تایی],
      ),
    ),
    divider: none,
  ),
  caption: [مرزهای فعالیت پرگار در یک نگاه.],
)

+ *پرگار دفتر طراحی ایده‌های خام نیست:* پرگار شرکتی نیست که کارفرما با یک ایده
  انتزاعی وارد آن شود و انتظار داشته باشد پرگار یک ماشین جدید را از پایه اختراع
  کند یا محاسبات مکانیکی آن را از صفر انجام دهد. مشتری باید طرح اولیه، نقشه یا
  نمونه فیزیکی آماده داشته باشد.

+ *پرگار وارد قطعات ساده بازاری نمی‌شود:* ساخت قطعات فوق‌ساده و تک‌فرآیندی (مانند
  پیچ و مهره استاندارد یا یک پین ساده ساختمانی) که در بازار به صورت فله‌ای معامله
  می‌شوند، در حوزه کاری پرگار نیست. مزیت پرگار در قطعات دقیق، حساس و چندمرحله‌ای
  است.

+ *تعهد ما انطباق ابعادی است، نه ریسک کارکرد کلی دستگاه مشتری:* پرگار مو‌به‌مو
  انطباق قطعه با نقشه‌های مصوب را تضمین می‌کند؛ اما اگر سیستم طراحی‌شده توسط خود
  مشتری به دلیل نقص محاسبات پایه‌ای خودش درست کار نکند، مسئولیت عملکردی متوجه
  پرگار نخواهد بود (اصل انجماد طراحی).

#newsec()
= ۶. راهنمای پیام‌ها و روایت‌های بازاریابی (برای تیم محتوا و تبلیغات)

#tbl-caption[
  جدول ۱ — روایت درست و خط قرمز ادراکی برای هر سرفصل موضوعی.
]
#ktable(
  breakable: true, zebra: true,
  columns: (auto, 1.35fr, 1.2fr),
  [سرفصل موضوعی], [چه پیامی را برجسته کنیم؟ (روایت درست)],
  [از چه کلماتی پرهیز کنیم؟ (خط قرمز ادراکی)],

  [*هویت برند*],
  [پلتفرم ارکستراسیون ساخت؛ شبکه سازندگان معتمد؛ تنها طرف پاسخگو و ضامن کیفیت],
  [کارگاه تراشکاری؛ دلال قطعه‌سازی؛ واسطه معمولی؛ دفتر طراحی محصول],

  [*خدمت مهندسی*],
  [ممیزی قابلیت ساخت (DFM)؛ بهینه‌سازی طرح برای کاهش هزینه؛ استخراج نقشه مهندسی
   معکوس],
  [طراحی صفر تا صد ایده؛ طراحی اختراع؛ تغییر دلخواه کارکرد سیستم مشتری],

  [*خدمت ساخت*],
  [ارکستراسیون فرآیندهای موازی (CNC، ورق، پوشش‌دهی)؛ مونتاژ مکانیکی هندسی قطعات],
  [کارهای تک‌فرآیندی ساده ارزان؛ خط تولید کارخانه‌ای انبوه؛ اتوماسیون برقی],

  [*کیفیت و آزمون*],
  [دروازه‌های کیفی اجباری؛ ارائه برگه کنترل کیفیت ابعادی (QC Report)؛ تست نشتی
   فرآیندی],
  [گارانتی کارکرد بدون قیدوشرط کل سیستم خریدار در هر شرایط محیطی ناشناخته],

  [*محصولات انکلوژر*],
  [جایگزین مطمئن واردات اروپایی؛ استاندارد بالا؛ کیفیت رنگ و پرداخت؛ ساخت سفارشی],
  [بدنه آماده انبوه انبارشده؛ ارزان‌ترین قاب بازار؛ طراحی الکترونیکی برد],

  [*ورود به سیستم*],
  [«نقشه‌تان را بفرستید تا بررسی فنی و پیشنهاد قیمت شفاف را دریافت کنید»],
  [«برای ثبت سفارش حتماً باید نرم‌افزار اختصاصی نصب کنید»],
)

// No #newsec(): a short section, run on from ۶ (FA-STYLE §4.1).
= ۷. جعبه‌ابزار اعتمادسازی در مذاکرات با مشتریان جدید

مدیران خرید و طراحان صنعتی ذاتاً محافظه‌کار هستند. برای ترغیب آن‌ها به اولین
همکاری، تیم بازاریابی و فروش می‌تواند از این چهار اهرم اعتمادساز استفاده کند:

+ *امضای سریع پیمان‌نامه عدم افشا (Mutual NDA):* حفظ کامل محرمانگی نقشه‌ها و
  بی‌نام‌سازی اسناد پیش از ارسال به کارگاه‌های شبکه جهت رفع کامل نگرانی سرقت
  مالکیت فکری.

+ *ارائه بررسی اولیه قابلیت ساخت (Free DFM Review):* بررسی اولیه فایل‌های مشتری و
  ارائه نکات بهبود ساخت به عنوان نمونه‌ای ملموس از تسلط مهندسی پرگار پیش از
  دریافت سفارش.

+ *برنامه آزمایشی کم‌ریسک (Prototype Trial):* پیشنهاد به مشتری برای شروع همکاری با
  سفارش تنها یک قطعه حساس یا نمونه اولیه، تا بدون پذیرش ریسک مالی سنگین، کیفیت
  زنجیره پرگار را از نزدیک بیازماید.

+ *تسویه اعتباری سازمانی (B2B Terms):* امکان فراهم‌سازی شرایط پرداخت منعطف و
  اعتباری (چک صیادی) برای خریداران معتبر صنعتی و کارخانجات پس از نخستین معاملات
  موفق.
