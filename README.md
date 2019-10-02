# Electrical_cost_prediction

# Home Electrical bill(in SEK) and it's Forecasting using Neural Network 
I have collected data from MälarEnergi of my home electrical usage and it's cost. Using those data I have used Neural Network on Time series data to find out the forecast of my cost for next 12 months, where we also tested the model with last 4 months original data.  
I have used R programming Language and it's different packages, like tidyr, dplyr, forecast and dygraphs for visualization and published the visualtization using rpubs.com


## Import Data myelData.csv file as myelData
## myelData.csv must be in the working directory
```R
myelData <- read.csv(file = 'myelData.csv')
head(myelData)
```
## Results
 0  390;2016.06.08;1
 1  411;2016-07-07;2
 2  408;2016-08-05;3
 3  424;2016-09-07;4
 4  408;2016-10-07;5
 5  484;2016-11-07;6
 6  672;2016-12-07;7
## 1st column is the cost of EL, 2nd is the month and 3rd is the serial number


# Foobar

Foobar is a Python library for dealing with word pluralization.

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install foobar
```

## Usage

```python
import foobar

foobar.pluralize('word') # returns 'words'
foobar.pluralize('goose') # returns 'geese'
foobar.singularize('phenomena') # returns 'phenomenon'
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
