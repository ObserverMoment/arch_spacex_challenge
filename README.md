# arch_x_spacex

A simple Flutter project to explore the SpaceX Public Api.

## Initial Ideas
1. SpaceX Rocket Battle (SpaceX Top Trumps). 

Pick your favourite rocket and then face off against a computer which is randomly selecting rockets and fields against you.

2. SpaceX Rocket Inspector.

List all the rockets and click through to a page showing detailed info about them. Plus choose a specific matric and visualise improvement through the series of rockets.

3. SpaceX - The History

Timeline style view of the history of SpaceX as seen through it's launches and milestones. View details, photos, rocket, capsule and payload info for each launch.

## Selected Idea, Reasoning and Priorities

 - Selected: Idea 3 (SpaceX - The History)
 - Reasoning: The main aim of the task was to provide a solid api client implementation for the SpaceX Api. Ideas 1 and 2 lean much more towards UX / UI complexity, with potentially most or all of the assigned time being used up with data vis or pure "design" work.
 - Priorities: Implement a solid api client with decent error handling, testing, reliability and scalability. Plus ensure separation the view and data logic within the architecture and folder structure.

## Suggested Features and Improvements
### Improvements
    - Custom styled widgets for use globally. Currently no themeing.
    - Investigate decoding json in isolates (if beneficial)
    - Api call rety logic (Chopper "RetryInteceptor")
    - Web / Desktop responsive design
    - Implement full routing solution such as GoRouter or AutoRoute.
    - MongoDB query API for call optimization (https://github.com/r-spacex/SpaceX-API/blob/master/docs/launches/v4/query.md)
    - Network image loading state and failure state.
    - Expanded widget, unit and integration testing.
    - All dates from the api are UTC, we may need to convert to local time (if it matters)
### Features
    - Sort the timeline list by date range.
    - Filter the timeline by various (launch success, rocket name)
    - Launch image gallery (view by launch or chronologically over time)
    - Save favourite rockets and capsules.

## Comments

The vast majority of launches use the Falcon 9 rocket, making the Rocket Info -> Details page functionality somewhat redundant. This page should be updated to show info beyond just the rocket if it is to be useful.
