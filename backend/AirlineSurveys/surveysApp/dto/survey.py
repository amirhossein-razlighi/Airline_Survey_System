class SurveyInfo:
    def __init__(self, activation_time, airline_id):
        self.activation_time = activation_time
        self.airline_id = airline_id


class QuestionInfo:
    def __int__(self, question_number, question_text, is_obligatory, responder_type, choices=None):
        self.question_number = question_number
        self.question_text = question_text
        self.is_obligatory = is_obligatory
        self.responder_type = responder_type
        self.choices = choices

    def __init__(self, request_data, choices):
        self.question_text = request_data.get('question_text')
        self.is_obligatory = request_data.get('is_obligatory')
        self.responder_type = request_data.get('responder_type')
        self.choices = choices
