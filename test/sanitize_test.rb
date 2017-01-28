test 'Sanitize'

t = %{<p><span class="fr-video fr-dvb fr-draggable" contenteditable="false" draggable="true"><iframe src="//www.youtube.com/embed/vppmqdnWKoc?wmode=opaque" frameborder="0" allowfullscreen="" style="width: 320px; height: 180px;"></iframe></span></p>}

is Convert.sanitize(t).strip, ''
is Convert.sanitize(t, :config => false).strip, t
is Convert.sanitize(t, :config => :custom).strip, t
