stylingOptions =
  # background color
  background: 'rgba(#fff, 0.2)'
  # show fullscreen -> true
  fullscreen: false
  # display position 'top', 'middle', 'bottom'
  vertical: 'bottom'
  # display position 'left, 'right'
  horizontal: 'left'

dateOptions =
  # display not only 'time' also 'date'
  showDate: false
  # format of 'date'
  date: '%d/%m/%Y %a'
  # format of 'time'
  time: '%l:%M %p'

format = (->
  if dateOptions.showDate
    dateOptions.date + '\n' +dateOptions.time
  else
    dateOptions.time
)()

command: "date +\"#{format}\""

# the refresh frequency in milliseconds
refreshFrequency: 30000

# for update function
dateOptions: dateOptions

render: (output) -> """
  <div id='simpleClock'>#{output}</div>
"""

update: (output) ->
  if this.dateOptions.showDate
    data = output.split('\n')

    html = data[1]
    html += '<span class="date">'
    html += data[0]
    html += '</span>'

  else
    html = output

  $(simpleClock).html(html)

style: (->
  fontSize = '7em'
  width = 'auto'
  transform = 'auto'
  bottom = '3%'
  top = 'auto'
  left = '3%'
  right = 'auto'

  if stylingOptions.fullscreen
    fontSize = '10em'
    width = '94%'

  if stylingOptions.vertical is 'middle'
    transform = 'translateY(50%)'
    bottom = '50%'
  else if stylingOptions.vertical is 'top'
    bottom = 'auto'
    top = '3%'

  if stylingOptions.horizontal is 'right'
    left = 'auto'
    right = '3%'

  return """
    background: #{stylingOptions.background}
    color: #FFFFFF
    font-family: Helvetica Neue
    left: #{left}
    right: #{right}
    top: #{top}
    bottom: #{bottom}
    transform: #{transform}
    width: #{width}

    #simpleClock
      font-size: #{fontSize}
      font-weight: 100
      margin: 0
      text-align: center
      padding: 10px 20px

    #simpleClock .date
      margin-left: .5em
      font-size: .5em
  """
)()
