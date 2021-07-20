<!-- iCalendar Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's iCalendar Management: <img src="../.pics/iCalendar/icalendar_logo.png" width="100"/>

### Summary:

The `iCalendar` domain specific language allows easy distribution of calandar data for senders and automatic import of events for receivers. All of the properties that are available to set in the Apple Calendar application GUI are also available when using the `iCalendar` programming format. Valid file extensions include, but are not limited to: `.ics`, `.ical`, `.ifb`, & `.icalendar`.

Below are some useful links to learn more about `iCalendar`:

1. [Official `iCalendar` Website](https://icalendar.org/)
2. [`iCalendar` Wiki](https://en.wikipedia.org/wiki/ICalendar)
3. [Mashup Guide's *Programming with `iCalendar`* Tutorial](https://mashupguide.net/1.0/html/ch15s04.xhtml)

> See `acm_example.ics` for a real-world example event sent to me for an ACM Tech Talk Webinar.

### Quick Example (from *Wikipedia*):

```icalendar
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//hacksw/handcal//NONSGML v1.0//EN
BEGIN:VEVENT
UID:uid1@example.com
DTSTAMP:19970714T170000Z
ORGANIZER;CN=John Doe:MAILTO:john.doe@example.com
DTSTART:19970714T170000Z
DTEND:19970715T035959Z
SUMMARY:Bastille Day Party
GEO:48.85299;2.36885
END:VEVENT
END:VCALENDAR
```