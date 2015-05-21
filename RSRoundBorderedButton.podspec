Pod::Spec.new do |s|

  s.name         = "RSRoundBorderedButton"
  s.version      = "0.1"
  s.summary      = "UIButton which mimics the AppStore Button"

  s.description  = <<-DESC
				   RSBorderedButton is an inheritance of UIButton with a round border like the buttons in the iOS AppStore.

				   All credits to the objective-c version: https://github.com/yhpark/YHRoundBorderedButton
                   DESC

  s.homepage     = "https://github.com/rusty1s/RSRoundBorderedButton"
  s.screenshots  = "https://github.com/rusty1s/RSRoundBorderedButton/blob/master/example.png"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Rusty1s" => "matthias.fey@tu-dortmund.de" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/rusty1s/RSRoundBorderedButton.git" }
  s.source_files  = "RSRoundBorderedButton/RSRoundBorderedButton/*.swift"

end
