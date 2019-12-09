

export class Event {
    data: string;
}

export type Listener = (event: Event) => void;

export class EventDispatcher {
    events: Array<Listener> = new Array();
}