// Smoke test for the Persian (RTL) path — verifies chrome, labels, logo,
// footer ("صفحه X از Y"), RTL table and body flow.
#import "../karun.typ": *

#let meta-fa = (
  title: "پروژه سوئیفت: چشم‌انداز و راهبرد محصول",
  subtitle: "بنیان و خانواده‌ی محصول",
  summary_title: "خلاصه‌ی مدیریتی: بازتعریف سوئیفت",
  employer: "شرکت کارون های‌تک",
  producer: "محمد سهرابی‌پور",
  access_level: 1,
  confidentiality: 3,
  doc_id: "SWIFT-PV-V02-20260518",
  date: "۱۴۰۵/۰۲/۲۸",
  year: 2025,
)

#show: karun-report.with(lang: "fa", meta: meta-fa)

#title-page(meta-fa, lang: "fa")
#contents-page(lang: "fa")

= گلوگاه داده‌های مهندسی

داده‌های مهندسی ارزشمندترین، قابل‌اعتمادترین و پراستفاده‌ترین دارایی در یک شرکت
تولیدی هستند؛ اما دسترسی به آن‌ها دشوار است. این یک پاراگراف آزمایشی است تا
راست‌چین بودن متن، فاصله‌گذاری و ترازبندی دوطرفه بررسی شود.

== هزینه‌ی پنهان

- مورد نخست با متن *پررنگ* برای آزمایش.
- مورد دوم با کد `SwiftBom` برای آزمایش.
- مورد سوم به‌صورت ساده.

این بخش پایانی برای اطمینان از درست بودن سرصفحه و پاصفحه‌ی فارسی است.
