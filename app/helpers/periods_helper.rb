module PeriodsHelper
  def date_range(from_date, until_date, options = {})
    options.symbolize_keys!
    format = options[:format] || :long
    separator = options[:separator] || "a"

    if format.to_sym == :short
      month_names = I18n.t("date.abbr_month_names")
    else
      month_names = I18n.t("date.month_names")
    end

    from_day = from_date.day
    from_month = month_names[from_date.month]
    from_year = from_date.year
    until_day = until_date.day

    dates = { from_day: from_day }

    if from_date.month == until_date.month && from_date.year == until_date.year
      date_format = "same_month"
      dates.merge!(until_day: until_day, month: from_month, year: from_year)
    else
      until_month = month_names[until_date.month]

      dates.merge!(from_month: from_month, until_month: until_month, until_day: until_day)

      if from_date.year == until_date.year
        date_format = "different_months_same_year"
        dates.merge!(year: from_year)
      else
        until_year = until_date.year

        date_format = "different_years"
        dates.merge!(from_year: from_year, until_year: until_year)
      end
    end

    I18n.t("date_range.#{format}.#{date_format}", dates.merge(sep: separator))
  end

  def plane_arrival_date(departure, arrival)
    if departure.blank? || arrival.blank?
      return nil
    end

    days = (arrival.to_date - departure.to_date).to_i

    if days > 0
      return "#{I18n.l(arrival, format: :time)} (+#{days})"
    else
      return I18n.l(arrival, format: :time)
    end
  end

  def duration_time(from, to)
    total_seconds = to - from
    mins = (total_seconds / 60) % 60
    hours = total_seconds / 3600

    hours > 0 ? format("%1dh %1dmin", hours, mins) : format("%1dmin", mins)
  end
end
