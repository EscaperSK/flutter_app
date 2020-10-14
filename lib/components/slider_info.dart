class SliderInfo {
  SliderInfo(currentValue, numberOfDots, onChange) {
    this.currentValue = currentValue;
    this.numberOfDots = numberOfDots;
    this.maxValue = numberOfDots - 1;
    this.onChange = onChange;
  }

  int currentValue, numberOfDots, maxValue;
  Function onChange;

  void setValue(int i) {
    currentValue = i;
    onChange();
  }

  void incValue() {
    if (currentValue < maxValue) {
      currentValue++;
      onChange();
    }
  }

  void decValue() {
    if (currentValue > 0) {
      currentValue--;
      onChange();
    }
  }
}
