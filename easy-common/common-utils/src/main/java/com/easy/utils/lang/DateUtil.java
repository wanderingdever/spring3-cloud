package com.easy.utils.lang;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.LocalDateTimeUtil;
import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static cn.hutool.core.date.DatePattern.PURE_TIME_FORMATTER;

/**
 * 时间工具
 * </p>
 *
 * @author Matt
 */
public class DateUtil extends cn.hutool.core.date.DateUtil {
    public static final String DATE_PATH = "yyyy/MM/dd";
    public static final String[] PARSE_PATTERNS =
            {"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss",
                    "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};

    public static final String[] WEEK = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};
    public static final String[] HOUR_INDEX = {"0-6", "6-8", "8-10", "10-12", "12-14", "14-16", "16-18", "18-20", "20-22", "22-24"};

    private DateUtil() {
        throw new IllegalAccessError("DateUtils.class");
    }

    public static String now() {
        return LocalDateTime.now(ZoneId.of("UTC+8")).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static LocalDateTime nowLocalDateTime() {
        return LocalDateTime.now(ZoneId.of("UTC+8"));
    }

    public static String getDate() {
        return format(LocalDateTime.now(ZoneId.of("UTC+8")), DatePattern.NORM_DATE_PATTERN);
    }

    /**
     * 获取当前年月日
     *
     * @return 日期路径 即年/月/日 如2018/08/08
     */
    public static String datePath() {
        return format(new Date(), DATE_PATH);
    }

    /**
     * 获取当前 时 分 秒 毫秒
     *
     * @return 日期数字  如154320846
     */
    public static String timeNum() {
        return format(new Date(), PURE_TIME_FORMATTER);
    }

    /**
     * 将一种日期时间格式转化为另外一种格式
     *
     * @param date         String 日期时间
     * @param sourceFormat 原来格式
     * @param format       转化格式
     * @return String日期
     */
    public static String formatStrToStr(String date, String sourceFormat, String format) {
        DateTime parse = DateUtil.parse(date, sourceFormat);
        return format(parse, format);
    }

    /**
     * 传入两个时间范围，返回这两个时间范围内的所有日期，并保存在一个集合中
     */
    public static List<String> findEveryDay(String beginTime, String endTime) {
        // 1.创建一个放所有日期的集合
        List<String> dates = new ArrayList<>();
        // 2.创建时间解析对象规定解析格式
        String datePattern = DatePattern.NORM_DATE_PATTERN;
        // 3.将传入的时间解析成Date类型,相当于格式化
        Date dBegin = parse(beginTime, datePattern);
        Date dEnd = parse(endTime, datePattern);
        // 4.将格式化后的第一天添加进集合
        dates.add(format(dBegin, datePattern));
        // 5.使用本地的时区和区域获取日历
        Calendar calBegin = Calendar.getInstance();
        // 6.传入起始时间将此日历设置为起始日历
        calBegin.setTime(dBegin);
        // 8.判断结束日期是否在起始日历的日期之后
        while (dEnd.after(calBegin.getTime())) {
            // 9.根据日历的规则:月份中的每一天，为起始日历加一天
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
            // 10.得到的每一天就添加进集合
            dates.add(format(calBegin.getTime(), datePattern));
            // 11.如果当前的起始日历超过结束日期后,就结束循环
        }
        return dates;
    }

    /**
     * 日期转星期
     */
    public static String dateToWeek(String date) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        // 获得一个日历
        Calendar cal = Calendar.getInstance();
        Date datet;
        try {
            datet = f.parse(date);
            cal.setTime(datet);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // 指示一个星期中的某天。
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0) {
            w = 0;
        }
        return weekDays[w];
    }

    /**
     * 根据星期获取下标 inex
     * 星期一为 0  以此类推
     */
    public static int getWeekIndex(String week) {
        if (StringUtils.isBlank(week)) {
            throw new RuntimeException("时间不能为空");
        }
        for (int i = 0; i < WEEK.length; i++) {
            if (WEEK[i].equals(week)) {
                return i;
            }
        }
        throw new RuntimeException("数据错误");
    }

    /**
     * 获取小时的下标 index
     * 0-6时     0
     * 6-8时     1
     * 8-10时    2
     * 10-12时   3
     * 12-14时   4
     * 14-16时   5
     * 16-18时   6
     * 18-20时   7
     * 20-22时   8
     * 22-24时   9
     */
    public static int getHourIndex(String date) {
        if (StringUtils.isBlank(date)) {
            throw new RuntimeException("时间不能为空");
        }
        // 截取小时
        int hour = Integer.parseInt(date.substring(11, 13));
        for (int i = 0; i < HOUR_INDEX.length; i++) {
            if (Integer.parseInt(HOUR_INDEX[i].split("-")[0]) <= hour && hour < Integer.parseInt(HOUR_INDEX[i].split("-")[1])) {
                return i;
            }
        }
        throw new RuntimeException("数据错误");
    }

    /**
     * 计算开始和借结束时间差值
     *
     * @param st  开始时间
     * @param end 结束时间
     * @return 秒数 long
     * @throws ParseException
     */
    public static long getTimeDifference(String st, String end) throws ParseException {
        if (StringUtils.isBlank(st) || StringUtils.isBlank(end)) {
            return 0;
        }
        if (st.equals(end)) {
            return 0;
        }
        SimpleDateFormat format = new SimpleDateFormat(PARSE_PATTERNS[1]);
        Date stDate = format.parse(st);
        Date endDate = format.parse(end);
        return getTimeDifference(stDate, endDate);
    }

    /**
     * 计算开始和借结束时间差值
     *
     * @param stDate  开始时间
     * @param endDate 结束时间
     * @return 秒数 long
     * @throws ParseException
     */
    public static long getTimeDifference(Date stDate, Date endDate) throws ParseException {
        if (stDate.getTime() > endDate.getTime()) {
            return 0;
        }
        long between = endDate.getTime() - stDate.getTime();
        return (between / 1000);
    }

    /**
     * 格式化成日期
     *
     * @param dateStr 标准日期格式 FastDateFormat：yyyy-MM-dd
     * @return LocalDate
     */
    public static LocalDate parseLocalDate(CharSequence dateStr) {
        return LocalDateTimeUtil.parseDate(dateStr, DatePattern.NORM_DATE_FORMATTER);
    }

    /**
     * 根据特定格式格式化日期
     *
     * @param localDate 被格式化的日期
     * @return 标准日期格式 FastDateFormat：yyyy-MM-dd
     */
    public static String formatDate(LocalDate localDate, String formatter) {
        return LocalDateTimeUtil.format(localDate, formatter);
    }

    /**
     * 根据给定的日期、类型和天数，计算新的日期。
     *
     * @param date 输入日期，格式为 "yyyy-MM-dd"
     * @param type 类型：0表示减日期，1表示加日期
     * @param days 加减的天数
     * @return 计算后的日期（LocalDate对象）
     * @throws DateTimeParseException 如果输入日期格式不正确
     */
    public static LocalDate addOrSubtractDays(String date, int type, int days) throws DateTimeParseException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(date, formatter);
        return switch (type) {
            case 0 ->
                // 向前计算（减少天数）
                    startDate.minusDays(days);
            case 1 ->
                // 向后计算（增加天数）
                    startDate.plusDays(days);
            default ->
                    throw new IllegalArgumentException("Invalid type specified. Expected 0 (for adding days) or 1 (for subtracting days).");
        };
    }

    /**
     * 根据给定的日期、类型和天数，计算新的日期。
     *
     * @param date 输入日期，格式为 "yyyy-MM-dd"
     * @param type 类型：0表示向后计算，1表示向前计算
     * @param days 加减的天数
     * @return 计算后的日期（String对象）
     * @throws DateTimeParseException 如果输入日期格式不正确
     */
    public static String addOrSubtractDaysStr(String date, int type, int days, String formatter) throws DateTimeParseException {
        LocalDate startDate = parseLocalDate(date);
        return switch (type) {
            case 0 ->
                // 向前计算（减少天数）
                    formatDate(startDate.minusDays(days), formatter);
            case 1 ->
                // 向后计算（增加天数）
                    formatDate(startDate.plusDays(days), formatter);
            default ->
                    throw new IllegalArgumentException("Invalid type specified. Expected 0 (for adding days) or 1 (for subtracting days).");
        };
    }

    /**
     * 根据给定的日期、类型和天数，计算新的日期。
     *
     * @param date   输入日期，格式为 "yyyy-MM-dd"
     * @param type   类型：0表示向后计算，1表示向前计算
     * @param months 加减的月数
     * @return 计算后的日期（String对象）
     * @throws DateTimeParseException 如果输入日期格式不正确
     */
    public static String addOrSubtractMonthsStr(String date, int type, int months, String formatter) throws DateTimeParseException {
        LocalDate startDate = parseLocalDate(date);
        return switch (type) {
            case 0 ->
                // 向前计算（减少天数）
                    formatDate(startDate.minusMonths(months), formatter);
            case 1 ->
                // 向后计算（增加天数）
                    formatDate(startDate.plusMonths(months), formatter);
            default ->
                    throw new IllegalArgumentException("Invalid type specified. Expected 0 (for adding days) or 1 (for subtracting days).");
        };
    }


    /**
     * 获取指定时区的当前时间作为LocalDateTime对象。
     *
     * @param timeZoneId 时区ID，例如 "Asia/Shanghai" 或 "America/New_York"
     * @return 指定时区的当前LocalDateTime
     */
    public static LocalDateTime getCurrentTimeInTimeZone(String timeZoneId) {
        ZoneId targetZone = ZoneId.of(timeZoneId);
        ZonedDateTime zonedDateTime = ZonedDateTime.now(targetZone);
        return zonedDateTime.toLocalDateTime();
    }


    /**
     * 根据给定的日期时间字符串和小时数，计算并返回过去或未来指定小时数后的日期时间字符串。
     *
     * @param dateTimeStr 原始日期时间字符串，格式为 "yyyy-MM-dd HH:mm:ss"
     * @param hoursOffset 小时偏移量，正数表示未来，负数表示过去
     * @return 计算后的新日期时间字符串，格式仍为 "yyyy-MM-dd HH:mm:ss"
     */
    public static String calculateByHours(String dateTimeStr, int hoursOffset) {
        LocalDateTime dateTime = parseLocalDateTime(dateTimeStr);
        LocalDateTime newDateTime = dateTime.plusHours(hoursOffset);
        return formatLocalDateTime(newDateTime);
    }

    /**
     * 根据给定的日期时间字符串和天数，计算并返回过去或未来指定天数后的日期时间字符串。
     *
     * @param dateTimeStr 原始日期时间字符串，格式为 "yyyy-MM-dd HH:mm:ss"
     * @param daysOffset  天数偏移量，正数表示未来，负数表示过去
     * @return 计算后的新日期时间字符串，格式仍为 "yyyy-MM-dd HH:mm:ss"
     */
    public static String calculateByDays(String dateTimeStr, int daysOffset) {
        LocalDateTime dateTime = parseLocalDateTime(dateTimeStr);
        LocalDateTime newDateTime = dateTime.plusDays(daysOffset);
        return formatLocalDateTime(newDateTime);
    }

    /**
     * 根据给定的日期时间字符串和月数，计算并返回过去或未来指定月数后的日期时间字符串。
     *
     * @param dateTimeStr  原始日期时间字符串，格式为 "yyyy-MM-dd HH:mm:ss"
     * @param monthsOffset 月数偏移量，正数表示未来，负数表示过去
     * @return 计算后的新日期时间字符串，格式仍为 "yyyy-MM-dd HH:mm:ss"
     */
    public static String calculateByMonths(String dateTimeStr, int monthsOffset) {
        LocalDateTime dateTime = parseLocalDateTime(dateTimeStr);
        LocalDateTime newDateTime = dateTime.plusMonths(monthsOffset);
        return formatLocalDateTime(newDateTime);
    }

}